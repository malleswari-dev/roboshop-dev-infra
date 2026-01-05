locals {
  ami_id = data.aws_ami.openvpn.id
  openvpn_sg_id = data.aws_ssm_parameter.openvpn_sg_id.value
  common_tags = {
    project = var.project_name
    environment = var.environment
    terraform = "true"
  }
  public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
}