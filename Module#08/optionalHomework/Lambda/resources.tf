# IAM policy document to allow the Lambda service to assume a role
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

# IAM role for Lambda with the assume role policy attached
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# IAM policy document granting access to specific S3 bucket operations
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

# IAM policy for S3 read access, attached to the Lambda role
resource "aws_iam_policy" "lambda_s3_read_policy" {
  name        = "lambda_s3_read_policy"
  description = "Allows Lambda function to read from a specific S3 bucket"
  policy      = data.aws_iam_policy_document.lambda_s3_access.json
}

# Attach the S3 read policy to the Lambda IAM role
resource "aws_iam_role_policy_attachment" "lambda_s3_access_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_s3_read_policy.arn
}

# Package the Lambda function code into a zip file
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function_payload.zip"
}

# Lambda function configuration
resource "aws_lambda_function" "lambda" {
  filename         = "lambda_function_payload.zip"
  function_name    = "users"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.12"
  timeout          = 6 # Adjusted for expected function execution time

  environment {
    variables = {
      created_by = "Maris Svirksts" # Metadata for tracking or audit purposes
    }
  }
}

# API Gateway HTTP API configuration for Lambda integration
resource "aws_apigatewayv2_api" "MyDemoHttpApi" {
  name          = "MyDemoHttpApi"
  protocol_type = "HTTP"
  description   = "HTTP API Gateway for Lambda integration"

  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["GET"]
    allow_headers = ["content-type"]
  }
}

# Integration between the HTTP API and the Lambda function
resource "aws_apigatewayv2_integration" "LambdaIntegration" {
  api_id           = aws_apigatewayv2_api.MyDemoHttpApi.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.lambda.invoke_arn
}

# Route configuration for the HTTP API Gateway
resource "aws_apigatewayv2_route" "DefaultRoute" {
  api_id    = aws_apigatewayv2_api.MyDemoHttpApi.id
  route_key = "GET /users"
  target    = "integrations/${aws_apigatewayv2_integration.LambdaIntegration.id}"
}

# Stage configuration for deploying the HTTP API
resource "aws_apigatewayv2_stage" "example" {
  api_id      = aws_apigatewayv2_api.MyDemoHttpApi.id
  name        = "test"
  auto_deploy = true
}

# Lambda permission to allow invocation from the API Gateway
resource "aws_lambda_permission" "AllowAPIGatewayInvoke" {
  statement_id  = "AllowAPIGatewayV2Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.MyDemoHttpApi.execution_arn}/*/*"
}
