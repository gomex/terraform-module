variable "hash_commit" {
  default = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
}

variable "name" {
  type        = string
  description = "Name of product"
}

variable "enable_sg" {
  type        = bool
  default     = false
  description = "Enable security group"
}

variable "ingress_ports" {
  type        = list
  default     = []
  description = "List of ingress ports to allow"
}