variable "region" {
}

variable "cluster_name" {
}

variable "custom_ami_id" {
  default = "ami-05a3e0187917e3e24"
}

variable "environment"{
}

variable "subnets" {
  description = "Map of subnet names to CIDR blocks and AZs"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "node_group_scaling" {
  description = "EKS node group scaling configuration"
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
}