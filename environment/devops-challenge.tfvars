region = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b"]
stage = "dev"
name = "moulin"
vpc_cidr="10.100.0.0/16"
kubernetes_version = "1.21"
oidc_provider_enabled = true
enabled_cluster_log_types = ["audit"]
cluster_log_retention_period = 7
instance_types = ["m5.large", "m5d.large", "m5n.large"]
instance_lifecycle = "SPOT"
desired_size = 2
max_size = 10
min_size = 2
kubernetes_labels = {}
addons = [
  {
    addon_name               = "vpc-cni"
    addon_version            = "v1.10.2"
    resolve_conflicts        = "NONE"
    service_account_role_arn = null
  },
  {
    addon_name               = "coredns"
    addon_version            = "v1.8.0"
    resolve_conflicts        = "NONE"
    service_account_role_arn = null
  },
  {
    addon_name               = "kube-proxy"
    addon_version            = "v1.21.2"
    resolve_conflicts        = "NONE"
    service_account_role_arn = null
  }
]
extra_node_policies = ["arn:aws:iam::aws:policy/AutoScalingFullAccess"]