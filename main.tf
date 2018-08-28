provider "aws" {
  version = "~> 1.26.0"
  region = "eu-west-1"
}

provider "archive" {}

data "archive_file" "zip" {
  type = "zip"
  source_file = "hello_lambda.py"
  output_path = "hello_lambda.zip"
}

resource "aws_iam_role" "lambda_iam_role" {
  name = "lambda_iam_role_for_jess"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda" {
  function_name = "hello_lambda_for_jess"
  handler = "hello_lambda.lambda_handler"
  runtime = "python2.7"

  role = "${aws_iam_role.lambda_iam_role.arn}"
  filename = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_sha}"

  environment {
    variables = {
      greeting = "Hello"
    }
  }
}
