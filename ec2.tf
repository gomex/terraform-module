data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["777015859311"] # My User
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [count = var.enable_sg ? aws_security_group.optional.id : data.aws_security_group.default.id]

  tags = {
    Name = "Hello World"
  }
}


