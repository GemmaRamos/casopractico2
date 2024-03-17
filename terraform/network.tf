resource "azurerm_virtual_network" "grc-net" {
  name                = "grc-net-cp2"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.grc-rg.location
  resource_group_name = azurerm_resource_group.grc-rg.name
}

resource "azurerm_subnet" "grc-subnet" {
  name                 = "grc-subnet-cp2"
  resource_group_name  = azurerm_resource_group.grc-rg.name
  virtual_network_name = azurerm_virtual_network.grc-net.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "grc-nic" {
  name                = "grc-nic-cp2"
  location            = azurerm_resource_group.grc-rg.location
  resource_group_name = azurerm_resource_group.grc-rg.name

  ip_configuration {
    name                          = "grc-ip-config"
    subnet_id                     = azurerm_subnet.grc-subnet.id
    private_ip_address_allocation = "Dynamic"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          = azurerm_public_ip.grc-public-ip.id
  }
}

resource "azurerm_public_ip" "grc-public-ip" {
  name                = "grc-public-ip-cp2"
  resource_group_name = azurerm_resource_group.grc-rg.name
  location            = azurerm_resource_group.grc-rg.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "CP2"
  }
}