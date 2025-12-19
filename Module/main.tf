module "rg" {
  source = "../child/azurerm_resourec_group"
  rg     = var.rg

}

module "net" {
  depends_on = [module.rg]
  source     = "../child/azurerm_networks"
  network    = var.network

}
module "vms" {
  depends_on = [module.net]
  source     = "../child/azurerm_vm"
  linux_vm   = var.linux_vm

}
