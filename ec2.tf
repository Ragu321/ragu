provider "aws" {
region ="ap-south-1"
}
resource "aws_instance" "demo-server" {
ami = "ami-05295b6e6c790593e"
instance_type = "t2.micro" 
key_name = "keypair"
security_groups = [ "demo-sg" ]
}
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"


ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  } 

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  
}
tags = {
    Name = "allow_tls"
  }
}

