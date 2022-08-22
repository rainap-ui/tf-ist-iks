vc_password="Cisco!123"
iksclustername="tf-iks-cluster01"
num-control-nodes=1
num-worker-nodes=1
num-load-balancer=1
num-worker-nodes-max=2
ssh_user="iksadmin"
ip_pool-name="iks-ippool"
ip_pool-starting-address="172.16.0.110"
ip_pool-pool-size=20
ip_pool-netmask="255.255.252.0"
ip_pool-gateway="172.16.0.2"
ip_pool-primary-dns =["10.76.101.130"]
sysconfig-policy-name="node-config"
ntp-servers=["ntp.esl.cisco.com"]
k8s_network-name="iks-k8sNetwork"
k8s_network-pod-cidr="100.65.0.0/16"
k8s_network-service-cidr="100.64.0.0/24"
k8s_network-cni="Calico"
k8s_version-policy-name="iks-version-1.21.13"
k8s_version-version-name="1.21.13-iks.0"
organization="default"
tags = [
  {
    "key" : "managed_by" 
    "value" : "IST"
  },
  {
    "key" : "owner"
    "value" : "prraina"
  }
]
