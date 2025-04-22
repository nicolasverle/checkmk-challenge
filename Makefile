KUBECONFIG := $(HOME)/.kube/config

setup:
	@echo "🔧 Creating kind cluster: staging"
	kind create cluster --name staging --config clusters/staging/kind-config.yaml
	@echo "🔧 Creating kind cluster: prod"
	kind create cluster --name prod --config clusters/prod/kind-config.yaml

clean:
	@echo "🧹 Deleting kind clusters..."
	kind delete cluster --name staging
	kind delete cluster --name prod

kube-contexts:
	kubectl config get-contexts
