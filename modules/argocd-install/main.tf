terraform {
  required_providers {
    argocd = {
      source = "mediwareinc/argocd"
      version = "2.2.6"
    }
  }
}

resource "null_resource" "argocd_port_forwarding" {
  provisioner "local-exec" {
    command = "kubectl port-forward $(kubectl get service --all-namespaces -l app.kubernetes.io/component=server --output=name) 8080:443 >/dev/null 2>&1 &"
  }
}

resource "null_resource" "argocd_set_passwd" {
  depends_on = [null_resource.argocd_port_forwarding]
  provisioner "local-exec" {
    command = "export ARGOCD_AUTH_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d; echo) && export ARGOCD_AUTH_USERNAME=admin"
  }
}


resource "argocd_repository" "private" {
  depends_on = [null_resource.argocd_port_forwarding, null_resource.argocd_set_passwd]

  repo            = var.repo
  username        = var.username
  ssh_private_key = var.ssh_private_key
  insecure        = var.insecure
}

