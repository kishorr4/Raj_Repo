module "rg" {
  source               = "../../module/azurerm_resource_group"
  azure_resource_group = var.rg

}

module "stg" {
  depends_on            = [module.rg]
  source                = "../../module/azurerm_storage_account"
  azure_storage_account = var.azure_storage_account
}

module "vnet" {
  depends_on            = [module.rg]
  source                = "../../module/azurerm_virtual_network"
  azure_virtual_network = var.azure_virtual_network

}
module "vm" {
  depends_on      = [module.vnet, module.nic, module.pip, module.k_secret]
  source          = "../../module/azurerm_virtual_machine"
  virtual_machine = var.virtual_machine

}
module "sql_server" {
  depends_on = [module.rg, module.k_secret]
  source     = "../../module/azurerm_sql_sever"
  sql_server = var.sql_server

}
module "sql_database" {
  depends_on   = [module.sql_server]
  source       = "../../module/azurerm_sql_database"
  sql_database = var.sql_database

}
module "pip" {
  depends_on   = [module.rg]
  source       = "../../module/azurerm_public_ip"
  azure_pip_vm = var.azure_pip_vm

}

module "nsg" {
  depends_on = [module.rg]
  source     = "../../module/azurerm_nsg"
  nsg        = var.nsg

}

module "nic" {
  depends_on = [module.rg, module.vnet]
  source     = "../../module/azurerm_network_interface"
  nic        = var.nic

}
module "lb" {
  depends_on = [module.rg, module.vnet, module.pip, module.nic]
  source     = "../../module/azurerm_load_balancer"
  azure_lb   = var.azure_lb

}
module "key_v" {
  depends_on      = [module.rg]
  source          = "../../module/azurerm_key_valut"
  azure_key_vault = var.azure_key_vault

}
module "k_secret" {
  depends_on  = [module.key_v]
  source      = "../../module/azurerm_key_valut_secrets"
  key_secrets = var.key_secrets

}

module "bastion" {
  depends_on = [module.rg, module.pip, module.vnet]
  source     = "../../module/azurerm_bastion"
  bastion    = var.bastion

}
