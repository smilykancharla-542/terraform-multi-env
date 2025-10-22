resource "aws_instance" "terraform" {

  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.all_allow .id]
  tags = merge(local.common_tags,{Name = "${local.common_name}-tfvar-multi-env" })  #Name will give name for instance and tag also,if u gave name it will give name tag only
}

resource "aws_security_group" "all_allow" {
  name   = "${local.common_name}-tfvars-multi-env"
  
  egress {
    from_port       = 0  #from 0 to 0 is opening all ports
    to_port         = 0
    protocol        = var.protocol  # allowing all protocals
    cidr_blocks      = var.cidir #internet
  }

  ingress {
    from_port       = 0  #from 0 to 0 is opening all ports
    to_port         = 0
    protocol        = var.protocol # allowing all protocals
    cidr_blocks      = var.cidir
  }

  tags = {
    name = "all_allow"
  }

}