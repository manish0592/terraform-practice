resource "aws_instance" "tf-instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = "Tfinstance"
    }
}