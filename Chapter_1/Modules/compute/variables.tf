variable "min_instance" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
  default     = 1
}

variable "max_instance" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
  default     = 3
}

variable "desired_instance" {
  description = "Desired number of instances in the Auto Scaling group"
  type        = number
  default     = 2
}

variable "subnet_id" {
  description = "Subnet IDs where the instances are launched"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the ALB target group to register instances with"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs attached to the instances"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID (AMIs are region-specific)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}