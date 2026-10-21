variable "ssh_sg" {
  type        = string
  description = "SSH security group"
  default     = "cmtr-otuokx4e-ssh-sg"
}

variable "public_http_sg" {
  type        = string
  description = "Public HTTP security group"
  default     = "cmtr-otuokx4e-public-http-sg"
}


variable "private_http_sg" {
  type        = string
  description = "Private HTTP security group"
  default     = "cmtr-otuokx4e-private-http-sg"
}

variable "allowed_ip_range" {
  type        = set(string)
  description = "allowed ip range"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "allowed ip range"
}