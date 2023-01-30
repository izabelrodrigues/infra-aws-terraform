resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_intensivao" {
  key_name   = "key_intensivao"
  public_key = tls_private_key.pk.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename        = "../${aws_key_pair.key_intensivao.key_name}.pem"
  content         = tls_private_key.pk.private_key_pem
  file_permission = "0400"
}
