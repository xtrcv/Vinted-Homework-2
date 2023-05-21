variable "vpc" {
  type    = string
  default = "my_vpc"
}

variable "subnet_name" {
  type = string
}

variable "cidr_range" {
  type = string
}

variable "atlantis_source_range" {
  type = list(string)
}

variable "ssh_source_range" {
  type = list(string)
}

variable "image_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "project_id" {
  type = string
}

variable "backend_bucket" {
  type = string
}

variable "region" {
  type = string
}

variable "service_account_email" {
  type = string
}