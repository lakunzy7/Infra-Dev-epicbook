resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "epic-book-db-${random_string.suffix.result}"
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.mysql_admin_username
  administrator_password = var.mysql_admin_password
  sku_name               = "B_Standard_B1ms"
  version                = "5.7"
}

resource "azurerm_mysql_flexible_database" "epic-book_db" {
  name                = var.mysql_database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}

resource "azurerm_mysql_flexible_server_firewall_rule" "allow_epic_book_vm" {
  name                = "allow-frontend-vm"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  start_ip_address    = var.epic_book_public_ip
  end_ip_address      = var.epic_book_public_ip
}
