variable "apikey" {
    type = string
}
variable "secretkey" {
    type = string
    default = "../Secretkey.txt"
}
variable "endpoint" {
    type = string
    default = "https://intersight.com"
}
variable "organization" {
  type        = string
  description = "Organization Name"
  default     = "default"
}
variable "ssh_user" {
  type        = string
  description = "SSH Username for node login."
}
variable "ssh_key" {
  type        = string
  description = "SSH Public Key to be used to node login."
}
variable "vc_password" {
  sensitive   = true
  type        = string
  description = "Password of the account to be used with vCenter.  This should be the password for the account used to register vCenter with Intersight."
}
variable "iksclustername" {
    type = string
}
variable "num-control-nodes" {
    type = number
}
variable "num-worker-nodes" {
    type = number
}
variable "num-load-balancer" {
    type = number
}
variable "num-worker-nodes-max" {
    type = number
}
variable "ip_pool-name" {
    type = string
}
variable "ip_pool-starting-address" {
    type = string
}

variable "ip_pool-pool-size" {
    type = number
}

variable "ip_pool-netmask" {
    type = string
}

variable "ip_pool-gateway" {
    type = string
}

variable "ip_pool-primary-dns" {
    type = list(string)
}
variable "sysconfig-policy-name" {
    type = string
}

variable "k8s_network-name" {
    type = string
}
variable "k8s_network-pod-cidr" {
    type=string
}

variable "k8s_network-service-cidr" {
    type=string
}

variable "k8s_network-cni" {
    type=string
}
variable "k8s_version-policy-name" {
    type = string
}

variable "k8s_version-version-name" {
    type = string
}
variable "tags" {
    type    = list(map(string))
}

