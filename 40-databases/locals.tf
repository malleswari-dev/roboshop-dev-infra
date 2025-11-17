locals {
  common_name_suffix = "${var.project_name}-${var.environment}"
  ami_id = data.aws_ami.joindevops.id
  common_tags = {
    project = var.project_name
    environment = var.environment
    terraform = "true"
  }
  database_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id
}