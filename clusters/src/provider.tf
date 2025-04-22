provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = var.cluster_name
  }
}
