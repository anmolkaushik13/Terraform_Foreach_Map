resource_groups = {
  "rg1" = {
    name     = "dev-rg1"
    location = "centralindia"
    tags = {
      owner         = "terraform"
      credit_limits = "5$"
    }
  }
}

vnets = {
  "vnet1" = {
    name           = "dev-vnet"
    resource_group = "dev-rg1"
    location       = "centralindia"
    address_space  = ["10.0.0.0/16"]

    subnet = {
      subnet1 = {
        name             = "dev-subnet1"
        address_prefixes = ["10.0.1.0/24"]

      }
      subnet2 = {
        name             = "dev-subnet2"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

pips = {
  "pip1" = {
    name                = "dev-pip1"
    location            = "centralindia"
    resource_group_name = "dev-rg1"
    allocation_method   = "Static"
  }
}

vms = {
  "vm1" = {
    nic_name             = "dev-nic-ci"
    location             = "centralindia"
    pip_name             = "dev-pip1"
    resource_group_name  = "dev-rg1"
    subnet_name          = "dev-subnet1"
    virtual_network_name = "dev-vnet"
    # admin_password       = "Test@123451234!"
    admin_username       = "Testuser"
    size    = "Standard_B1s"
    vm_name = "devvmci"
    kv_key               = "kv1"               # ← ye batata hai kaunsa Key Vault use karna hai
    secret_name          = "vm1-password"  
  }
}

kvs = {
  "kv1" = {
    name                       = "dev-keyvault"
    location                   = "centralindia"
    resource_group_name        = "dev-rg1"
    soft_delete_retention_days = 7
    purge_protection_enabled   = true
    sku_name                   = "premium"
  }
}

kvsecret = {
  "vm1-password" = {
    name  = "vm1-password"
    value = "Test@12345!"
  }
}