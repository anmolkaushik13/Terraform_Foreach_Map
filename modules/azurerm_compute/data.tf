data "azurerm_public_ip" "datapip" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "datasubnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

# Get password secret from Key Vault
data "azurerm_key_vault_secret" "vm_password" {
  for_each    = var.vms
  name        = "vm-password"
  key_vault_id = var.key_vaults["kv1"]
}