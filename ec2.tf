#One EC2 instance (Ubuntu OS) of type m5.large in the private subnet PostgreSQL on it. The following script can be injected via userdata to setup PostgreSQL
resource "aws_instance" "database" {
  ami                    = data.aws_ami.ubuntu_image.id
  instance_type          = var.ec2_type_db
  subnet_id              = aws_subnet.onprem_private_subnet.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  key_name               = var.keypair_name


  tags = {
    Name = "Database Server"
  }
  associate_public_ip_address = true
}

#Second EC2 instance in the public subnet with pgAdmin on it. The following script can be injected via userdata to setup pgAdmin
resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.ubuntu_image.id
  instance_type          = var.ec2_type_webserver
  subnet_id              = aws_subnet.onprem_public_subnet.id
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  key_name               = var.keypair_name


  tags = {
    Name = "Webserver"
  }
  associate_public_ip_address = true
}


#routetables 
#userdata
#iam 