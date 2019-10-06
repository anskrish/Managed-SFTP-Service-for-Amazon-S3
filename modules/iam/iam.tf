resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role"
  assume_role_policy = <<POLICY
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "transfer.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
POLICY
}
resource "aws_iam_policy" "policy" {
  name        = "SFTP-policy"
  description = "SFTP S3 ACCESS policy"
  policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
POLICY
}
resource "aws_iam_role_policy_attachment" "sftp-arrow" {
  role       = "${aws_iam_role.ec2_s3_access_role.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
