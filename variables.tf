variable "helms" {
  description = "helm chart to deploy"
  type = list(object({
    helm_name              = string
    helm_version           = string
    helm_public_repo       = string
    helm_namespace = string
    values                 = list(string)
    additional_parameters  = list(object({
      name  = string
      value = string
    }))
  }))
  default = []
}

variable "argocd_repo" {
  description = "argocd repo info"
  type = object({
    repo            = string
    username        = string
    ssh_private_key = string
    insecure        = bool
  })
}


