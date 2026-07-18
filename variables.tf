variable "myrg" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
  }))
}

variable "mystg" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string

    network_rules = optional(map(object({
      default_action = string
    })))
  }))
}
