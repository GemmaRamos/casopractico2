resource "azurerm_kubernetes_cluster" "aks" {
  name                = "grc-aks-cp2"
  location            = azurerm_resource_group.grc-rg.location
  resource_group_name = azurerm_resource_group.grc-rg.name
  dns_prefix          = "aksgrcdnsprefixcp2"

  default_node_pool {
    name                = "default"
    node_count          = var.system_node_count
    vm_size             = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "CP2"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}