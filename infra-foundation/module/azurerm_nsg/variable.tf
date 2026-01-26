variable "nsg" {
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    security_rule_name  = string
    tags                = map(string)
  }))

}
