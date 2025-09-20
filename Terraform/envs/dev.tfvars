environment = "dev"
region = "us-east-1"
cluster_name = "demo-eks-cluster"
subnets = {
  subnet-1 = {
    cidr_block        = "10.0.0.0/20"
    availability_zone = "us-east-1a"
  }
}
node_group_scaling = {
  desired_size   = 1
    max_size     = 2
    min_size     = 1
}