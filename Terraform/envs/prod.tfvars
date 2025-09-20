environment = "prod"
region = "us-east-1"
cluster_name = "demo-eks-cluster"
subnets = {
  subnet-1 = {
    cidr_block        = "10.0.17.0/20"
    availability_zone = "us-east-1b"
  }
  subnet-2 = {
    cidr_block        = "10.0.33.0/20"
    availability_zone = "us-east-1c"
  }
}
node_group_scaling = {
  desired_size   = 2
    max_size     = 3
    min_size     = 1
}