variable "image_id" {
    type = string #Optional
    default = "ami-090252cbe067a9e58"#Optional
    description = "RHEL -9 AMI ID" #Optional
  }

variable "instance_type" {
    default = "t3.micro"
    type = string
  }
variable "tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "DB"
    }
}

variable "sg_name" {
    default = "allow_ssh1"
}

variable "sg_description" {
    default = "allowing port 22"
}

variable "ssh_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}