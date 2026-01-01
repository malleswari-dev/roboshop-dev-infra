# module "components" {
#     source = "../../terraform-roboshop-component"
#     component = var.component
#     rule_priority = var.rule_priority

# }

module "component" {
    for_each = var.component
    source = "git::https://malleswari-dev/terraform-roboshop-component.git?ref=main"
    component = each.key
    rule_priority = each.value.rule_priority
}