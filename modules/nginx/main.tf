resource "helm_release" "nginx_ingress" {
    name = var.release_name
  namespace  = var.namespace
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = var.chart_version

  create_namespace = true

  values = [
    templatefile("${path.module}/values.yaml.tmpl", {
      controller_service_type = var.controller_service_type
    })
  ]
}
