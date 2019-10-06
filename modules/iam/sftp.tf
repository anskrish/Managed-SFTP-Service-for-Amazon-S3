resource "aws_transfer_server" "foo" {
  endpoint_type = "PUBLIC"
  identity_provider_type = "SERVICE_MANAGED"
  logging_role           = "${aws_iam_role.ec2_s3_access_role.arn}"

  tags = {
    NAME = "tf-acc-test-transfer-server"
    ENV  = "sftp-demo"
  }
}
resource "aws_transfer_user" "foo" {
  server_id = "${aws_transfer_server.foo.id}"
  user_name = "tftestuser"
  role      = "${aws_iam_role.ec2_s3_access_role.arn}"
  home_directory = "/${var.bucket_name}"
  tags = {
    NAME = "tftestuser"
  }
}

resource "aws_transfer_ssh_key" "foo" {
  server_id = "${aws_transfer_server.foo.id}"
  user_name = "${aws_transfer_user.foo.user_name}"
  body      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZ3VBe4aw0mWeRZcL7ESHr6Yz3hl66oC/FNO8MQhYupNLzfo8tJxVCp/yAWsXjaosrNflWTGuKA8ho6Sv+QfQaeAN3/qpkmyrLtnPYdlMEEILgD2UqbqAWg62WEA8KXyvYxP7RwsESl1CDrBT4ka/gMTFInBvXBozKgKN41oJFmoAbWqYDRxijRX1Pm2+2x1T7MHhALyN+Xs8o+7Je9TO+VsQLKEjPjYg997pg8BzcgBZaYCdxZnpLg2G1udirQAPtpdZQedRF1b+nbrTUyry2Waoku0bKuBYCrDxvffGoSJDoPQopwrwC5HjOOYz7DIpW4hqVLvwejN2pFGXQmT+z root@ip-172-31-42-49"
}

