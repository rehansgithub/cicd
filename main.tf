resource "aws_key_pair" "vprofile-prod-key" {
  key_name   = "project-key"
  public_key = file("project.pub")
}


resource "aws_instance" "project-instances" {
  for_each = local.instances

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  key_name               = aws_key_pair.vprofile-prod-key.key_name
  vpc_security_group_ids = each.value.security_group

  #vpc_security_group_ids = each.key == var.instance_to_allow_security_group ? [aws_security_group.jenkins.id] : [aws_security_group.regular.id]



  tags = {
    Name = each.value.name
  }


}