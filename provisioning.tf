/*
resource "null_resource" "remote_exec" {

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("project")
    host        = aws_instance.project-instances["myddevlinx02"].public_ip
  }




  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/rabbitmq.sh",
      "sudo /tmp/rabbitmq.sh"
    ]
  }
}
*/

