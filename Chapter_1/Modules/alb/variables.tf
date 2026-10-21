variable "listener_port" {
  description = "Port the ALB listener accepts traffic on"
  type        = number
  default     = 80
}

variable "listener_protocal" {
  description = "Listener protocol (HTTP or HTTPS)"
  type        = string
  default     = "HTTP"
}

variable "lb_subnet_ids" {
  description = "Subnets the ALB is deployed into"
  type        = list(string)
}

variable "lb_security_group" {
  description = "Security group IDs attached to the ALB"
  type        = list(string)
}

variable "lb_target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "lb-target-group"
}

variable "lb_target_group_port" {
  description = "Target group port"
  type        = number
  default     = 80
}

variable "target_group_protocal" {
  description = "Target group protocol"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "VPC ID for the target group"
  type        = string
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}