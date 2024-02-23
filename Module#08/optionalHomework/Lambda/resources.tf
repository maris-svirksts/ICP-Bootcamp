data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "lambda_s3_access" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket}",
      "arn:aws:s3:::${var.bucket}/*",
    ]
  }
}

resource "aws_iam_policy" "lambda_s3_read_policy" {
  name        = "lambda_s3_read_policy"
  description = "Allows Lambda function to read from a specific S3 bucket"
  policy      = data.aws_iam_policy_document.lambda_s3_access.json
}

resource "aws_iam_role_policy_attachment" "lambda_s3_access_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_s3_read_policy.arn
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "data_for_website"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.12"

  timeout = 6 # Function tends to timeout otherwise.

  environment {
    variables = {
      created_by = "Maris Svirksts"
    }
  }
}

resource "aws_apigatewayv2_api" "http_api" {
  name          = "data_for_website-API"
  protocol_type = "HTTP"
  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["GET", "POST", "OPTIONS"]
    allow_headers = ["Content-Type"]
  }
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.lambda.invoke_arn
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "lambda_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_stage" "default_stage" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "default"
  auto_deploy = true
}

resource "aws_lambda_permission" "api_gateway_http" {
  statement_id  = "AllowExecutionFromHTTPAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.http_api.arn}/*/*"
}

output "http_api_url" {
  value       = "${aws_apigatewayv2_api.http_api.api_endpoint}/default"
  description = "The invoke URL of the HTTP API Gateway"
}