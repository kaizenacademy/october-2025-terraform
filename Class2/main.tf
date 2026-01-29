resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-adileta"
  force_destroy = true
}

resource "aws_s3_bucket" "example2" {
  bucket = "hello-kaizenaa"
  force_destroy = true
}

resource "aws_s3_object" "object" {
  depends_on = [aws_s3_bucket.example]
  bucket = "kaizen-adileta"
  key    = "main.tf"
  source = "main.tf"
}