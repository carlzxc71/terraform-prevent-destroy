resource "random_password" "this" {
  length  = 16
  special = true

  keepers = {
    Password = "sql-randompassword"
  }
}

resource "azurerm_mssql_server" "this" {
  name                         = "sql-prod-sc-database"
  resource_group_name          = azurerm_resource_group.this.name
  location                     = azurerm_resource_group.this.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = random_password.this.result
}
