module "eks_cluster"{
    source = "../../modules/eks"
    vpc_name = "eks-vpc"
    vpc_cidr_block = "10.0.0.0/16"
    subnets = {
            1 = {
                name              = "eks-subnet-dev1"
                env               = "dev"
                cidr_block        = "10.0.0.0/20"
                availability_zone = "us-east-1a"
            }
            2 = {
                name              = "eks-subnet-prod1"
                env               = "prod"
                cidr_block        = "10.0.16.0/20"
                availability_zone = "us-east-1b"
            }
            3 = {
                name              = "eks-subnet-prod2"
                env               = "prod"
                cidr_block        = "10.0.32.0/20"
                availability_zone = "us-east-1c"
            }
            }
    cluster_name = "eks-cluster"
    cluster_version = "1.32"
    eks_cluster_role_name = "eks-cluster-role"
    node_role_name = "eks-node-role"
    cluster_policy_arns = [ "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
                            "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
                            ]
    node_policy_arns = [ "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
                        "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
                        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly" 
                        ]
    eks_addon = [ "vpc-cni",
                  "kube-proxy",
                  "coredns"
                ]      
    node_group = {
        1 = {
            environment       = "dev"
            desired_size      = 1
            max_size          = 2
            min_size          = 1
            labe_role         = "worker"
            instance_type     = "t2.medium"
            ami_type          = "AL2023_x86_64_STANDARD"
        }
        2 = {
            environment       = "prod"
            desired_size      = 2
            max_size          = 3
            min_size          = 1
            labe_role         = "worker"
            instance_type     = "t2.medium"
            ami_type          = "AL2023_x86_64_STANDARD"
        }
    }
    
}