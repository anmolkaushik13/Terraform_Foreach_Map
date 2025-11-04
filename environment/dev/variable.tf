variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags = object({
      owner         = string
      credit_limits = string
    })
  }))
}

variable "vnets" {
  type = map(object({
    name           = string
    location       = string
    resource_group = string
    address_space  = list(string)

    subnet = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "pips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}

variable "vms" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    pip_name             = string
    subnet_name          = string
    virtual_network_name = string
    # admin_password       = string
    admin_username       = string
    size                 = string
    vm_name              = string
     kv_key               = string        # ← add this
    secret_name          = string  
  }))
}

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

# variable "key_vaults" {
#   description = "Map of key vault IDs passed from key vault module"
#   type        = map(string)
# }