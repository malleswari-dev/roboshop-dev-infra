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

# # frontend accepting traffic from frontend alb
# resource "aws_security_group_rule" "frontend_frontend_alb" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   security_group_id = module.sg[9].sg_id # frontend sg id
#   source_security_group_id = module.sg[11].sg_id # frontend alb sg id
# }