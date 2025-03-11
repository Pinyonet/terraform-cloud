
variable "virginia_cidr" {
  description = "CIDR de la VPC de Virginia"
  type        = string
}

# variable "public_subnet" {
#   description = "CIDR public subnet"
#   type = string
# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
#   type = string
# }

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}


variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Specifications EC2"
  type        = map(string)
}


variable "enable_monitoring" {
  description = "Habilitar el despliegue de un servidor de monitoreo"
  # type        = bool
  type        = number

}

variable "ingress_ports_list" {
  description = "Lista de puertos de ingreso"
  type        = list(number)
  
}

variable "access_key" {

  
}

variable "secret_key" {

  
}