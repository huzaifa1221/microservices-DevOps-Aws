# this will be a three node cluster ( 1 for dev and 2 for prod )

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version = var.cluster_version

  vpc_config {
    subnet_ids = [for s in aws_subnet.eks_subnet : s.id]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}

resource "aws_eks_addon" "addons" {
  for_each = toset(var.eks_addon)
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = each.value
  depends_on = [aws_eks_cluster.eks_cluster]
}

resource "aws_eks_node_group" "eks_nodes" {
  for_each = var.node_group
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "ng-${each.value.environment}"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [
                      for s in aws_subnet.eks_subnet : s.id
                      if s.tags["env"] == each.value.environment
                    ]
  scaling_config {
    desired_size = each.value.desired_size
    max_size     = each.value.max_size
    min_size     = each.value.min_size
  }
  labels = {
    environment = each.value.environment
    role        = each.value.labe_role
  }
  instance_types = [each.value.instance_type]
  ami_type = each.value.ami_type
  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.worker_node_policy,
  ]
}