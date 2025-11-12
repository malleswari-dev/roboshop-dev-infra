# open source module

#  module "catalogue" {
#    source = "terraform-aws-modules/security-group/aws"

#    name        = "${local.common_name_suffix}-catalogue"  # roboshop-dev-catalogue
#    use_name_prefix = false
#    description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
#    vpc_id      = data.aws_ssm_parameter.vpc_id.value
#  }

module "sg" {
  source = "git::https://github.com/malleswari-dev/terraform-aws-sg.git?ref=main"
  count = length(var.sg_name)
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_name[count.index]
  sg_description = "created for ${var.sg_name[count.index]}"
  vpc_id = local.vpc_id
}