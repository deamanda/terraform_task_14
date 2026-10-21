variable "vpc_id" {
  type        = string
  description = "allowed ip range"
}

variable "sg_ssh_id" {
  type        = string
  description = "SSH security group id"
}

variable "sg_public_http_id" {
  type        = string
  description = "Public HTTP security group id"
}

variable "sg_private_http_id" {
  type        = string
  description = "Private HTTP security group id"
}

variable "template" {
  type        = string
  description = "template name"
  default     = "cmtr-otuokx4e-green-template"
}

variable "asg" {
  type        = string
  description = "autoscaling group name"
  default     = "cmtr-otuokx4e-asg"
}

variable "loadbalancer" {
  type        = string
  description = "loadbalancer name"
  default     = "cmtr-otuokx4e-lb"
}

variable "tg" {
  type        = string
  description = "target group"
  default     = "cmtr-otuokx4e-tg"
}

variable "subnet1_id" {
  type        = string
  description = "subnet1 id"
  default     = ""
}

variable "subnet2_id" {
  type        = string
  description = "subnet2 id"
  default     = ""
}

variable "subnet3_id" {
  type        = string
  description = "subnet3 id"
  default     = ""
}
