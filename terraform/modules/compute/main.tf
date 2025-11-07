resource "azurerm_public_ip" "epic_book_pip" {
  name                = "${var.application_name}-${var.environment}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "epic_book_nic" {
  name                = "${var.application_name}-${var.environment}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.epic_book_pip.id
  }
}


resource "azurerm_linux_virtual_machine" "epic_book_vm" {
  name                  = "${var.application_name}-${var.environment}-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.epic_book_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "${var.application_name}-${var.environment}-vm-disk"
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("${path.module}/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  disable_password_authentication = true
}


