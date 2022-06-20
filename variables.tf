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

variable "ssh_user" {
    type = string
}
variable "ssh_key" {
    type = string
}

variable "ip_pool-name" {
    type = string
}

variable "sysconfig-policy-name" {
    type = string
}

variable "k8s_network-name" {
    type = string
}

variable "k8s_version-policy-name" {
    type = string
}

variable "k8s_version-version-name" {
    type = string
}

variable "k8s_infra-policyName" {
    type = string
}

variable "k8s_worker-policyName" {
    type = string
}

variable "organization" {
    type = string
}
variable "tags" {
    type    = list(map(string))
}

