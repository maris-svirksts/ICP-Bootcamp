terraform {
  required_providers {
    aws = {
      version = ">=5.34.0"
    }
  }
}

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

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "snowflake_lambda.py"
  output_path = "snowflake_lambda_function_payload.zip"
}

resource "aws_lambda_function" "snowflake_lambda" {
  filename      = "snowflake_lambda_function_payload.zip"
  function_name = "snowflake_to_lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.test"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.12"

  environment {
    variables = {
      created_by = "Maris Svirksts"
    }
  }
}