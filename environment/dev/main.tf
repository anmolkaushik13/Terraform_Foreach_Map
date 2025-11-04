module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_networking_components"
  vnets      = var.vnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
}

module "virtual_machine" {
  depends_on = [module.resource_group, module.public_ip, module.virtual_network]
  source     = "../../modules/azurerm_compute"
  vms        = var.vms
  key_vaults = module.key_vaults.key_vault_ids
}

module "key_vaults" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  kvs        = var.kvs
  kvsecret   = var.kvsecret
}
