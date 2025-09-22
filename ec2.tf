
# EC2 instance For Nginx setup
resource "aws_instance" "nginxserver" {
  ami                         = "ami-08718895af4dfa033"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.my-security-grp.id]    #implicit dependency
 associate_public_ip_address = true   # ✅ Enable public IP
  key_name = "nsd"
  depends_on = [ aws_security_group.my-security-grp ] #explicit dependency
  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    #replace_triggered_by = [ aws_security_group.nginx-sg,aws_security_group.nginx-sg.ingress ]

    precondition {
      condition = aws_security_group.my-security-grp.id != ""   #means sg should not be blank
      error_message = "security group id must not be blank"
    }
    postcondition {
      condition = self.public_ip != ""
      error_message = "Public IP is not generated"

    }
  }

  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y
            sudo systemctl start nginx
            sudo systemctl enable nginx
            EOF

  tags = {
    Name = "NginxServer"
  }
}
