resource "azurerm_linux_virtual_machine" "grc-vm" {
  name                = "grc-vm-cp2"
  resource_group_name = azurerm_resource_group.grc-rg.name
  location            = azurerm_resource_group.grc-rg.location
  size                = var.vm_size
  admin_username      = "gemma"
  network_interface_ids = [
    azurerm_network_interface.grc-nic.id,
  ]

  admin_ssh_key {
    username   = "gemma"
    public_key = file("C:/Users/gemma/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "centos-8-0-free"
    product   = "centos-8-0-free"
    publisher = "cognosys"
  }

  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-0-free"
    sku       = "centos-8-0-free"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.grc-sa.primary_blob_endpoint
  }

  tags = {
    environment = "CP2"
  }
}