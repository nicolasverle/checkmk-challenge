# Cluster settings
cluster_name = "kind-staging"

# ArgoCD settings
argocd_release_name  = "argocd"
argocd_namespace     = "argocd"
argocd_chart_version = "7.8.23"
argocd_values_file   = ["argocd.yaml"]

# NGINX ingress settings
nginx_release_name  = "ingress-nginx"
nginx_namespace     = "ingress-nginx"
nginx_chart_version = "4.12.1"
nginx_service_type  = "NodePort"
