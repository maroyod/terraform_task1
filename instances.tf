resource "aws_instance" "web" {
  #this is ami for red-hat os 
  ami           = "ami-0c9978668f8d55984"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              EOF
  vpc_security_group_ids      = [aws_security_group.web.id]

}