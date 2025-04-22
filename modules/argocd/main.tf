resource "helm_release" "argocd" {
  name             = var.release_name
  repository       = var.repository
  chart            = var.chart
  version    = var.chart_version
  namespace        = var.namespace
  create_namespace = true

  values = [for f in var.values_file : file(f)]

  set {
    name  = "server.service.type"
    value = var.service_type
  }

  dynamic "set" {
    for_each = var.extra_set
    content {
      name  = set.key
      value = set.value
    }
  }
}
