resource "helm_release" "this_release" {
  depends_on = [kubernetes_namespace.this-ns]
  name       = var.helm_name
  repository = var.helm_public_repo
  namespace = var.helm_namespace
  chart      = "${var.helm_name}"
  version    = var.helm_version
  values     = [for file in var.values_files : file("${path.module}/${var.helm_name}/${file}")]
    dynamic "set" {
     for_each = var.additional_parameters

     content {
       name  = set.value.name
       value = set.value.value
     }
   }

}

resource "kubernetes_namespace" "this-ns" {
  metadata {
    name = var.helm_namespace
}
}
