variable "ami_id" {
  type        = string
  description = "Id da imagem da instãncia"
  default     = "ami-0aa7d40eeae50c9a9"
}

variable "ami_type" {
  type        = string
  description = "Tipo da instância"
  default     = "t2.micro"
}
