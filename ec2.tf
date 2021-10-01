##Creating a Security Group
resource "aws_security_group" "ibm_app_sg" {
  name        = "allow_app"
  description = "Allow app inbound traffic"
  vpc_id      = aws_vpc.ibm.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "Allow all traffic"
  }
}


##Launch Instance
resource "aws_instance" "ibm_instance" {
  ami                    = "ami-011996ff98de391d1"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.ibm_pub_subnet.id
  key_name               = "Shub"
  count                  =  2   
  vpc_security_group_ids = [ aws_security_group.ibm_app_sg.id ]
  user_data              = file("ecomm.sh")
}

