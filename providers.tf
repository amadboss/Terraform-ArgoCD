terraform {
  required_providers {
    argocd = {
      source = "mediwareinc/argocd"
      version = "2.2.6"
    }
  }
}

provider "kubernetes" {
    config_path = "~/.kube/config"
    config_context = "admin-tf-cluster-test-amad-1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "admin-tf-cluster-test-amad-1"
  }
}

provider "argocd" {
  insecure = true
  server_addr = "<srv address>"
}
