resource "aws_key_pair" "main" {
  key_name   = "MyMacLocalKey"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "dynamic" {
  name        = "terraform-session8-sg"
  description = "This is a security group for ec2 instance"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
}

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
}
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "main" {
    ami = "ami-00a8151272c45cd8e"
    instance_type = "t3.micro"
    key_name = aws_key_pair.main.id
    vpc_security_group_ids = [ aws_security_group.dynamic.id ]
    depends_on = [ aws_security_group.dynamic ] // Explicit Dependency

// File Provisioner
    provisioner "file" {
        source = "./index.html" // Local path, The path where your file is located, (local machine path)
        destination = "/tmp/index.html" // Remote path, The path where you send the file to, remote machine (EC2 Instance)
    }
    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip // Public IP of your instance (EC2)
      private_key = file("~/.ssh/id_ed25519")
    }
// Remote Exec
   provisioner "remote-exec" {
     inline = [ 
        "sudo dnf install httpd -y",
        "sudo systemctl enable httpd",
        "sudo systemctl start httpd",
        "sudo cp /tmp/index.html /var/www/html/index.html"
      ]
    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip // Public IP of your instance (EC2)
      private_key = file("~/.ssh/id_ed25519")
    }
   }
}

resource "aws_s3_bucket" "main" {
  bucket = "terraform-session-s3-bucket-kris"
}

resource "null_resource" "upload" {
  provisioner "local-exec" {
    command = "aws s3 cp ./local-exec.txt s3://${aws_s3_bucket.main.bucket}"
  }
}