environment = "prod"
region = "us-east-1"
cluster_name = "demo-eks-cluster"
subnets = {
  subnet-1 = {
    cidr_block        = "10.0.16.0/20"
    availability_zone = "use1-az1"
  }
  subnet-2 = {
    cidr_block        = "10.0.32.0/20"
    availability_zone = "use1-az2"
  }
}
node_group_scaling = {
  desired_size   = 2
    max_size     = 3
    min_size     = 1
}