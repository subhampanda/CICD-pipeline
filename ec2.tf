resource "aws_instance" "example" {
  ami           = "ami-074cce78125f09d61"
  instance_type = "t2.micro"
}
