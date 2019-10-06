resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.bucket_name}"
  acl = "private"
  tags {
    Name = "sftp-server-bucket"
  }

}
