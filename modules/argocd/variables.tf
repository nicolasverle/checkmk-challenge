variable "release_name" {
  description = "Helm release name"
  type        = string
  default     = "argocd"
}

variable "repository" {
  description = "Helm repo URL"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "chart" {
  description = "Chart name"
  type        = string
  default     = "argo-cd"
}

variable "chart_version" {
  description = "Chart version"
  type        = string
}

variable "namespace" {
  description = "Deployment namespace"
  type        = string
  default     = "argocd"
}

variable "service_type" {
  description = "Service type for argocd-server (ClusterIP, NodePort, LoadBalancer)"
  type        = string
  default     = "ClusterIP"
}

variable "values_file" {
  description = "YAML file to configure the chart"
  type        = list(string)
  default     = []
}

variable "extra_set" {
  description = "extra key/values parameters"
  type        = map(string)
  default     = {}
}
