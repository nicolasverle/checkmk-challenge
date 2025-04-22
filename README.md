# Terraform POC - Multi-cluster Helm Deployment (ArgoCD)

This proof of concept demonstrates how to deploy the [ArgoCD Helm chart](https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd) using Terraform in a multi-cluster `kind` environment (`staging` and `prod`).

## ✨ Objectives

- Use Terraform modules and best practices for Helm deployments.
- Deploy the same Helm chart on two different Kubernetes clusters.
- Expose ArgoCD via an NGINX ingress controller and access it locally.

---

## 📦 Stack

- Terraform `>= 1.11`
- Helm `>= 3.17`
- Kubernetes CLI `kubectl`
- [kind](https://kind.sigs.k8s.io/) for local Kubernetes clusters

---

## ⚙️ Setup

```bash
make setup
```

This will:
- Create two kind clusters: `staging` and `prod`
- Set up kubeconfig contexts for each

---

## 🚀 Deploy ArgoCD and Ingress Controller

### Deploy to `staging`

```bash
cd clusters/staging
terraform init
terraform apply -auto-approve
```

### Deploy to `prod`

```bash
cd clusters/prod
terraform init
terraform apply -auto-approve
```

---

## 🌍 Access ArgoCD UI

The ArgoCD UI is exposed through the NGINX ingress controller at:

```
https://localhost:8080
```

Initial username is `admin`. Retrieve the password with:

```bash
kubectl --context kind-staging -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

---

## 🧹 Teardown

```bash
make clean
```

---

## 🧠 Notes

- The modules are reusable and fully configurable.
- Values can be overridden via `values.yaml` or inline variables.
- Multiple clusters are managed via separate stages (`staging/`, `prod/`), each with its own providers and module usage.
- Ingress exposes services using NodePort mapping (30080 -> HTTP).
