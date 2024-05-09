#resource <resource-type> <resource-name>
resource "aws_instance" "db" {
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh1.id]
    instance_type = var.instance_type

    tags = var.tags
}

resource "aws_security_group" "allow_ssh1" {
  name = var.sg_name
  description = var.sg_description

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
}