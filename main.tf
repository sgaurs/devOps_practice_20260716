resource "azurerm_resource_group" "testrg" {
  for_each = var.myrg

  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
}

resource "azurerm_storage_account" "teststg" {
  for_each = var.mystg
  depends_on = [ azurerm_resource_group.testrg ]

  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  dynamic "network_rules" {
    for_each = each.value.network_rules != null ? each.value.network_rules : {}

    content {
      default_action = network_rules.value.default_action
    }
  }
}