resource aws_key_pair my_key {
    key_name = "ansible-key"
    public_key = file("ansible-key.pub")
}

resource "aws_default_vpc" "default" {
     
}

resource "aws_security_group" "my_security_group" {
       name = "automate-sg"
       description = "This will add a TF generated Security gp"
       vpc_id = aws_default_vpc.default.id

     ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
     } 

      ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open"
     }

     egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access open outbound"
     } 
   



}


resource "aws_instance" "my_instance"{
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = "t2.micro"
    ami= "ami-02b8269d5e85954ef"


  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 15
    volume_type = "gp3"
  }

     tags= {
        Name="Ansible-CICD-automate"
     }
}