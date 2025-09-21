region = "us-east-1"
cluster_name = "demo-eks-cluster"
subnets = {
  1 = {
    env               = "dev"
    cidr_block        = "10.0.0.0/20"
    availability_zone = "us-east-1a"
  }
  2 = {
    env               = "prod"
    cidr_block        = "10.0.16.0/20"
    availability_zone = "us-east-1b"
  }
  3 = {
    env               = "prod"
    cidr_block        = "10.0.32.0/20"
    availability_zone = "us-east-1c"
  }
}