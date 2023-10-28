resource "aws_key_pair" "site_key" {
  key_name   = var.site_key_name
  public_key = var.site_public_key
}
