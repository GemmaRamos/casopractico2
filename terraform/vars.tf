variable "location" {
    type        = string
    description = "Región de Azure donde crearemos la infraestructura"
    default     = "France Central"
}

variable "vm_size" {
    type        = string
    description = "Tamaño de la máquina virtual"
    default     = "Standard_DS1_v2" # 3.5 GB, 1 CPU
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
  default = 2
}