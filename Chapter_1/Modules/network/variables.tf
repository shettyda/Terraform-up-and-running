
# Modules/network/variables.tf
variable "igw_name" {
  description = "Name tag for the internet gateway"
  type        = string
  default     = "Terra_Created_IGW"
}