resource "azurerm_key_vault" "kvs" {
  for_each                    = var.kvs
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = each.value.sku_name
access_policy {
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Create",
    "Get",
  ]

  secret_permissions = [
    "Set",
    "Get",
    "Delete",
    "Purge",
    "Recover",
  ]

  storage_permissions = [
    "Get",
  ]
}
}


resource "azurerm_key_vault_secret" "secrets" {
  for_each     = var.kvsecret
  name         = each.value.name
  value        = each.value.value
  key_vault_id = values(azurerm_key_vault.kvs)[0].id
}
