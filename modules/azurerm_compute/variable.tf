variable "vms" {
  type = map(object({
    nic_name = string
    location = string
    resource_group_name = string
    pip_name = string
    subnet_name = string
    virtual_network_name = string
    # admin_password = string
    admin_username = string
    size = string
    vm_name = string
     kv_key               = string        # ← add this
    secret_name          = string  
  }))
}

variable "key_vaults" {
  description = "Map of Key Vault IDs"
  type        = map(string)
}