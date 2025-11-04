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
