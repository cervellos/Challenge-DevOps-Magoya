region = "sa-east-1"

availability_zones = ["sa-east-1a"]

namespace = "demo"

stage = "test"

name = "eks"

# oidc_provider_enabled is required to be true for VPC CNI addon
oidc_provider_enabled = true

enabled_cluster_log_types = ["audit"]

cluster_log_retention_period = 1

instance_types = ["t3.small"]

desired_size = 1

max_size = 1

min_size = 1

kubernetes_labels = {}

cluster_encryption_config_enabled = true

# When updating the Kubernetes version, also update the API and client-go version in test/src/go.mod
kubernetes_version = "1.29"

private_ipv6_enabled = false

addons = [
  # https://docs.aws.amazon.com/eks/latest/userguide/managing-kube-proxy.html
  {
    addon_name                  = "kube-proxy"
    addon_version               = null
    resolve_conflicts_on_create = "OVERWRITE"
    resolve_conflicts_on_update = "PRESERVE"
    service_account_role_arn    = null
  },
  # https://docs.aws.amazon.com/eks/latest/userguide/managing-coredns.html
  {
    addon_name               = "coredns"
    addon_version            = null
    resolve_conflicts        = "NONE"
    service_account_role_arn = null
  },
]
