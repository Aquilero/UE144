# EC2 Instanz zum Testen des Setupt


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "test" {
  count                  = length(var.subnet_ids)
  ami                    = var.instance_ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_ids[count.index]
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = var.key


  tags = {
    Name = "EC2 ${count.index + 1}"
  }
}
