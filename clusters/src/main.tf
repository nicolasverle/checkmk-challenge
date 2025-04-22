module "nginx_ingress" {
  source                  = "../../modules/nginx"
  release_name            = var.nginx_release_name
  namespace               = var.nginx_namespace
  chart_version           = var.nginx_chart_version
  controller_service_type = var.nginx_service_type
}

module "argocd" {
  source        = "../../modules/argocd"
  release_name  = var.argocd_release_name
  namespace     = var.argocd_namespace
  chart_version = var.argocd_chart_version
  values_file   = var.argocd_values_file

  depends_on = [module.nginx_ingress]
}
