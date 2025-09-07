####
# Create IAM users and policies for continoues deployement account
####

resource "aws_iam_user" "cd" {
  name = "cloudopspipeline-cd"

}

resource "aws_iam_access_key" "cd" {
  user = aws_iam_user.cd.name

}

####
# Policy for backend S3 and dynamodb access
####

data "aws_iam_policy_document" "tf-backend" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.tf-state-bucket}"]
  }
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = [
      "arn:aws:s3:::${var.tf-state-bucket}/tf-state-deploy/*",
      "arn:aws:s3:::${var.tf-state-bucket}/tf-state-deploy-env/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]
    resources = [
      "arn:aws:dynamodb:*:*:table/${var.tf-state-locking}"
    ]
  }

}

resource "aws_iam_policy" "tf-backend" {
  name        = "${aws_iam_user.cd.name}-tf-s3-dynamodb"
  description = "Allow user to use s3 and dynamor db for tf backend ressources"
  policy      = data.aws_iam_policy_document.tf-backend.json
}

resource "aws_iam_user_policy_attachment" "tf-backend" {
  user       = aws_iam_user.cd.name
  policy_arn = aws_iam_policy.tf-backend.arn

}