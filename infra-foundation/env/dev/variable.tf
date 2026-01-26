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

variable "azure_key_vault" {
  type = map(object({
    key_vault_name             = string
    location                   = string
    resource_group_name        = string
    sku_name                   = string
    soft_delete_retention_days = number
  }))
}

variable "key_secrets" {
  type = map(object({
    secret_name         = string
    key_value           = string
    key_vault_name      = string
    resource_group_name = string
  }))

}

variable "azure_lb" {
  type = map(object({
    lb_name               = string
    location              = string
    resource_group_name   = string
    fip_name              = string
    backend_pool_name     = string
    lb_rule_name          = string
    protocol              = string
    frontend_port         = number
    backend_port          = number
    lb_prob_name          = string
    port                  = number
    ip_configuration_name = string
    nic_name              = string
    lb_pip_name           = string
  }))

}

variable "nic" {
  type = map(object({
    nic_name_lb                   = string
    location                      = string
    resource_group_name           = string
    private_ip_address_allocation = string
    ip_configuration_name         = string
    subnet_name                   = string
    virtual_network_name          = string
  }))

}

variable "nsg" {
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    security_rule_name  = string
    tags                = map(string)
  }))

}

variable "azure_pip_vm" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string))
  }))

}

variable "rg" {
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
  }))

}

variable "sql_database" {
  type = map(object({
    sql_database_name   = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    tags                = map(string)
    server_name         = string
    resource_group_name = string
  }))

}

variable "sql_server" {
  type = map(object({
    sql_server_name     = string
    resource_group_name = string
    location            = string
    minimum_tls_version = string
    tags                = optional(map(string))
    key_vault_name      = string
    sql_server_username = string
    sql_server_password = string
    server_version      = string
  }))

}

variable "azure_storage_account" {
  type = map(object({
    storage_account_name     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string

    provisioned_billing_model_version = optional(string)
    cross_tenant_replication_enabled  = optional(bool)
    access_tier                       = optional(string)
    https_traffic_only_enabled        = optional(bool)
    min_tls_version                   = optional(string)
    allow_nested_items_to_be_public   = optional(bool)
    shared_access_key_enabled         = optional(bool)
    public_network_access_enabled     = optional(bool)
    default_to_oauth_authentication   = optional(bool)
    is_hns_enabled                    = optional(bool)
    nfsv3_enabled                     = optional(bool)
    large_file_share_enabled          = optional(bool)
    local_user_enabled                = optional(bool)
    sftp_enabled                      = optional(bool)
    dns_endpoint_type                 = optional(string)
    tags                              = optional(map(string))
  }))

}

variable "virtual_machine" {
  type = map(object({
    nic_name                      = string
    location                      = string
    resource_group_name           = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    vm_name                       = string
    size                          = string
    caching                       = string
    storage_account_type          = string
    publisher                     = string
    offer                         = string
    sku                           = string
    version_vm                    = string
    virtual_network_name          = string
    pip_name                      = string
    key_vault_name                = string
    vm_user_name                  = string
    vm_pass_name                  = string
    subnet_name                   = string

  }))
}

variable "azure_virtual_network" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))
    tags                = optional(map(string))
    subnet = map(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
  }))
}
