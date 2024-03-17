resource "azurerm_network_security_group" "grc-sec-group" {
  name                = "grc-sec-group-cp2"
  location            = azurerm_resource_group.grc-rg.location
  resource_group_name = azurerm_resource_group.grc-rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "CP-2"
  }
}

resource "azurerm_network_interface_security_group_association" "grc-sec-gr-association" {
  network_interface_id      = azurerm_network_interface.grc-nic.id
  network_security_group_id = azurerm_network_security_group.grc-sec-group.id
}