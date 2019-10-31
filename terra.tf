provider "aws" {
	access_key = "AKIA6BCHFZ2QW42WRFFT"
	secret_key = "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"
	region = "ap-south-1"
}

resource "aws_instance" "practice" {
	ami = "ami-0cb0e70f44e1a4bb5"
	instance_type = "t2.micro"
	#key_name = "terraform.key"
	security_groups = ["${aws_security_group.allow_rdp1.name}"]
tags = {
	Name = "Terra_focus1"
}
}
resource "aws_security_group" "allow_rdp1" {
	name = "allow_rdp1"
	description = "Allow ssh traffic"
ingress {
	from_port = "3389"
	to_port	= "3389"
	protocol = "tcp"
	
	cidr_blocks = ["0.0.0.0/0"]
} 
}
