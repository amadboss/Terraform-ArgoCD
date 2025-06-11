
variable "helm_name" {
  type        = string
}

variable "helm_version" {
  type        = string
}

variable "helm_public_repo" {
  type        = string
  default     = null  
}

variable "values_files" {
  type        = list(string)
  default     = []
}


variable "helm_namespace" {
  type        = string
}

variable "additional_parameters" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

