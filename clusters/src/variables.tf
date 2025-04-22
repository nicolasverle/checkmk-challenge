# ---------------------------
# Cluster Configuration
# ---------------------------
variable "cluster_name" {
  description = "Name of the cluster to use"
  type        = string
}

# ---------------------------
# ArgoCD Configuration
# ---------------------------
variable "argocd_release_name" {
  description = "Helm release name for ArgoCD"
  type        = string
}

variable "argocd_namespace" {
  description = "Namespace where ArgoCD will be installed"
  type        = string
}

variable "argocd_chart_version" {
  description = "Version of the ArgoCD Helm chart"
  type        = string
  default     = "7.8.27"
}

variable "argocd_values_file" {
  description = "Path to ArgoCD values YAML file"
  type        = list(string)
  default     = []
}

# ---------------------------
# NGINX Ingress Configuration
# ---------------------------
variable "nginx_release_name" {
  description = "Helm release name for NGINX ingress controller"
  type        = string
}

variable "nginx_namespace" {
  description = "Namespace where NGINX ingress controller will be installed"
  type        = string
}

variable "nginx_chart_version" {
  description = "Version of the NGINX ingress Helm chart"
  type        = string
  default     = "4.12.1"
}

variable "nginx_service_type" {
  description = "Service type for NGINX ingress (NodePort or LoadBalancer)"
  type        = string
  default     = "NodePort"
}
