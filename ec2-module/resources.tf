data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t3.micro"
  monitoring           = true
  ebs_optimized        = true
  iam_instance_profile = "test"
  credit_specification {
    cpu_credits = "unlimited"
  }
  root_block_device {
    encrypted = true
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_network_interface" "foo" {
  attachment {
    instance     = aws_instance.web.id
    device_index = 0
  }

  subnet_id = "your_subnet_id"  # Replace with the actual subnet ID
}