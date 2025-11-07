# General Settings
application_name = "epic-book"
environment      = "dev"
location         = "Australia Central"

# Networking Configuration
vnet_address_space             = ["10.0.0.0/16"]
public_subnet_address_prefixes = ["10.0.1.0/24"]

# Virtual Machine Configuration
admin_username = "azureuser"
admin_password = "YourSecureVMPassword123!"

# Database Configuration
mysql_admin_username = "mysqladmin"
mysql_admin_password = "YourSecureMySQLPassword123!"
mysql_database_name  = "bookstore_dev"
