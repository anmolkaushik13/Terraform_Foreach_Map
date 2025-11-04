variable "kvs" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}

variable "kvsecret" {
  type = map(object({
    name = string
    value = string
  }))
}
