resource "aws_instance" "ec2" {
  ami           = data.aws_ami.linux_amazon.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  user_data            = var.user_data
  iam_instance_profile = var.iam_instance_profile
}