provider "azurerm" {
  features {}
}

# Criar Grupo de Recursos
resource "azurerm_resource_group" "server_rg" {
  name     = var.server_rg
  location = var.location
}

# Criar Network Security Group
resource "azurerm_network_security_group" "server_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.server_rg.name
}

# Regra Network Security Group
resource "azurerm_network_security_rule" "nsg_rule" {
  name                        = var.nsg_rule_name
  priority                    = 500
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = var.portas_liberadas
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.server_rg.name
  network_security_group_name = azurerm_network_security_group.server_nsg.name
}

# Associar o NSG a Subnet
#resource "azurerm_subnet_network_security_group_association" "nsg_associate_subnet" {
# subnet_id                 = azurerm_subnet.subnet.id
#network_security_group_id = azurerm_network_security_group.server_nsg.id
#}
