variable "network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))
    subnet = map(object({
      sub_name       = string
      address_prefix = list(string)
    }))
    tags = optional(map(string))
  }))

}
