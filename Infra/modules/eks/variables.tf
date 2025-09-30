# main
variable "cluster_name" {
  type = string
}
variable "cluster_version" {
  type = string
}
variable "eks_addon" {
  type = list(string)
}
variable "node_group" {
  description = "node groups for eks cluster"
  type = map(object({
    desired_size      = number
    max_size          = number
    min_size          = number
    environment       = string
    labe_role         = string
    instance_type     = string
    ami_type          = string
  }))
}

# networking
variable "subnets" {
  description = "Map of subnet names to CIDR blocks and AZs"
  type = map(object({
    name              = string
    env               = string
    cidr_block        = string
    availability_zone = string
  }))
}
variable "vpc_cidr_block"{
  type = string
}
variable "vpc_name"{
  type = string
}

# roles
variable "eks_cluster_role_name" {
  type = string
}
variable "node_role_name" {
  type = string
}
variable "cluster_policy_arns" {
  type = list(string)
}
variable "node_policy_arns" {
  type = list(string)
}
