data "aws_security_group" "default" {

  filter {
    name   = "group-name"
    values = ["default"] 
  }

  tags = {
    name   = "produto"
    values = ["default"] 
  }
}


resource "aws_security_group" "optional" {
  count = var.enable_sg ? 1 : 0
  name        = "allow-traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}