module "helm-install" {
  source = "./modules/helm-install"
  for_each = { for helm in var.helms : helm.helm_name => helm }
  
  helm_name              = each.value.helm_name
  helm_version           = each.value.helm_version
  helm_public_repo       = each.value.helm_public_repo
  helm_namespace = each.value.helm_namespace
  values_files           = each.value.values
  additional_parameters  = each.value.additional_parameters

}

module "argocd-install" {
  source = "./modules/argocd-install"

  providers = {
    argocd = argocd
  }
  
  repo = var.argocd_repo.repo
  username = var.argocd_repo.username
  ssh_private_key = var.argocd_repo.ssh_private_key 
  insecure = var.argocd_repo.insecure
}


