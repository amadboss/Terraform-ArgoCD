helms = [

{
  helm_name = "traefik"
  helm_version = null
  helm_public_repo = "https://helm.traefik.io/traefik"
  helm_namespace = "traefik"
  
  values = ["values.yaml"]
  
  additional_parameters = [ 
  {
    name = "securityContext.allowPrivilegeEscalation"
    value = "true"
  }
  ]

},

{
  helm_name = "cert-manager"
  helm_version = null
  helm_public_repo = "https://charts.jetstack.io"
  helm_namespace = "cert-manager"
  
  values = []
  
  additional_parameters = [ 
  {
    name = "installCRDs"
    value = "true"
  }
  ]

},

{
  helm_name = "argo-cd"
  helm_version = null
  helm_public_repo = "https://argoproj.github.io/argo-helm"
  helm_namespace = "argocd"
  
  values = []
  
  additional_parameters = [ 
  ]

},

]


argocd_repo = {
  argocd_namespace = "argocd"
  repo            = "<repo link>"
  username        = "<username>"
  ssh_private_key = <<EOF
-----BEGIN OPENSSH PRIVATE KEY-----
<ssh key>
-----END OPENSSH PRIVATE KEY-----
EOF
insecure = true
}

