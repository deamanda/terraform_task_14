variable "vpc" {
  type        = string
  description = "vpc name"
  default     = "cmtr-otuokx4e-vpc"
}
variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
  default     = "10.10.0.0/16"
}

variable "subnet1" {
  type        = string
  description = "subnet1 name"
  default     = "cmtr-otuokx4e-subnet-public-a"
}

variable "subnet2" {
  type        = string
  description = "subnet2 name"
  default     = "cmtr-otuokx4e-subnet-public-b"
}

variable "subnet3" {
  type        = string
  description = "subnet3 name"
  default     = "cmtr-otuokx4e-subnet-public-c"
}

variable "az1" {
  type        = string
  description = "availability zone1"
  default     = "eu-west-1a"
}

variable "az2" {
  type        = string
  description = "availability zone1"
  default     = "eu-west-1b"
}

variable "az3" {
  type        = string
  description = "availability zone3"
  default     = "eu-west-1c"
}

variable "cidr1" {
  type        = string
  description = "subnet1 cidr"
  default     = "10.10.1.0/24"
}

variable "cidr2" {
  type        = string
  description = "subnet2 cidr"
  default     = "10.10.3.0/24"
}

variable "cidr3" {
  type        = string
  description = "subnet3 cidr"
  default     = "10.10.5.0/24"
}

variable "ig" {
  type        = string
  description = "internet gateway name"
  default     = "cmtr-otuokx4e-igw"
}

variable "rt" {
  type        = string
  description = "routing table"
  default     = "cmtr-otuokx4e-rt"
}