variable "server_rg" {
  description = "Nome do Grupo de Recursos"
  default     = "RG-Servidores-teste"
}

variable "location" {
  description = "Localização que os recursos serão criados"
  default     = "EastUS"
}

variable "nsg_name" {
  description = "Nome do Network Security Group"
  default     = "nsg-servidores02"
}

variable "nsg_rule_name" {
  description = "Nome da regra Network Security Grupo"
  default     = "Allow_Porta_HTTP_HTTPS_RDP"
}

variable "portas_liberadas" {
  description = "Portas liberadas na regra do NSG"
  type        = list(string)
  default     = ["3389", "443", "80"]
}

#variable "nsg_associate_subnet" {
# description = "Associar NSG a Subnet"
#type = "subnet-01"

#}

