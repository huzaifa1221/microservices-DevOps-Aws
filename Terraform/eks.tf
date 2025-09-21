resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version = "1.32"

  vpc_config {
    subnet_ids = [for s in aws_subnet.eks_subnet : s.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_vpc_resource_controller
  ]
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "vpc-cni"
  depends_on = [aws_eks_cluster.eks_cluster]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "kube-proxy"
  depends_on = [aws_eks_cluster.eks_cluster]
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "coredns"
  depends_on = [aws_eks_cluster.eks_cluster]
}

# dev 
resource "aws_eks_node_group" "eks_nodes_dev" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.cluster_name}-ng-dev"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [
                      for s in aws_subnet.eks_subnet : s.id
                      if s.tags["env"] == "dev"
                    ]
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }
  labels = {
    environment = "dev"
    role        = "worker"
  }
  instance_types = ["t2.medium"]
  ami_type = "AL2023_x86_64_STANDARD"
  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.registry_policy
  ]
}

# prod
resource "aws_eks_node_group" "eks_nodes_prod" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.cluster_name}-ng-prod"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [
                      for s in aws_subnet.eks_subnet : s.id
                      if s.tags["env"] == "prod"
                    ]
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  labels = {
    environment = "prod"
    role        = "worker"
  }
  instance_types = ["t2.medium"]
  ami_type = "AL2023_x86_64_STANDARD"
  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.registry_policy
  ]
}