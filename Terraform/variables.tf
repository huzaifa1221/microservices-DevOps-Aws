variable "region" {
}

variable "cluster_name" {
}

variable "custom_ami_id" {
  default = "ami-05a3e0187917e3e24"
}

variable "subnets" {
  description = "Map of subnet names to CIDR blocks and AZs"
  type = map(object({
    env               = string
    cidr_block        = string
    availability_zone = string
  }))
}