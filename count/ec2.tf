#resource <resource-type> <resource-name>
resource "aws_instance" "devphani" {
    #count = 3
    count = length(var.instance_names)
    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = [aws_security_group.allow_ssh1.id]
    instance_type = "t3.micro"

    tags = {
      Name = var.instance_names[count.index]
    }
}

resource "aws_security_group" "allow_ssh1" {
    name = "allow_ssh1"
    description = "allowing ssh access"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    } 

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        name = "allo_ssh"
        CreatedBy = "DevPhani"
    }
}
