variable "bastion" {
  type = map(object({
    bastion_name          = string
    location              = string
    resource_group_name   = string
    ip_configuration_name = string
    virtual_network_name  = string
    pip_name              = string
    subnet_name           = string
  }))

}
