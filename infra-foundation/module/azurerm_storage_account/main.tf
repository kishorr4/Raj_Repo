resource "azurerm_storage_account" "example" {
  for_each                 = var.azure_storage_account
  name                     = each.value.storage_account_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  provisioned_billing_model_version = "V2"
  cross_tenant_replication_enabled  = false
  access_tier                       = "Hot"
  edge_zone                         = null
  https_traffic_only_enabled        = true
  min_tls_version                   = "TLS1_2"
  allow_nested_items_to_be_public   = true
  shared_access_key_enabled         = true
  public_network_access_enabled     = true
  default_to_oauth_authentication   = false
  is_hns_enabled                    = true
  nfsv3_enabled                     = false
  large_file_share_enabled          = false
  local_user_enabled                = true
  sftp_enabled                      = false
  dns_endpoint_type                 = "Standard"

  tags = each.value.tags
}

