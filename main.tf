provider "intersight" {
  apikey    = var.apikey
  secretkey = var.secretkey
  endpoint  = var.endpoint
}

module "iks_cluster" {
  source  = "terraform-cisco-modules/iks/intersight//"
  version = "2.4.0"

  # Kubernetes Cluster Profile  Adjust the values as needed.
  cluster = {
    name                = var.iksclustername
    action              = "Deploy"
    wait_for_completion = false
    worker_nodes        = var.num-worker-nodes
    load_balancers      = var.num-load-balancer
    worker_max          = var.num-worker-nodes-max
    control_nodes       = var.num-control-nodes
    ssh_user            = var.ssh_user
    ssh_public_key      = var.ssh_key
  }

  # IP Pool Information (To create new change "use_existing" to 'false' uncomment variables and modify them to meet your needs.)
  ip_pool = {
    use_existing = false
    name         = var.ip_pool-name
    ip_starting_address = var.ip_pool-starting-address
    ip_pool_size        = var.ip_pool-pool-size
    ip_netmask          = var.ip_pool-netmask
    ip_gateway          = var.ip_pool-gateway
    dns_servers         = var.ip_pool-primary-dns
  }

  # Sysconfig Policy (UI Reference NODE OS Configuration) (To create new change "use_existing" to 'false' uncomment variables and modify them to meet your needs.)
  sysconfig = {
    use_existing = true
    name         = var.sysconfig-policy-name
  }

  # Kubernetes Network CIDR (To create new change "use_existing" to 'false' uncomment variables and modify them to meet your needs.)
  k8s_network = {
    use_existing = false
    name         = var.k8s_network-name
    pod_cidr     = var.k8s_network-pod-cidr
    service_cidr = var.k8s_network-service-cidr
    cni          = var.k8s_network-cni
  }

  # Version policy (To create new change "use_existing" to 'false' uncomment variables and modify them to meet your needs.)
  versionPolicy = {
    useExisting    = false
    policyName     = var.k8s_version-policy-name
    iksVersionName = var.k8s_version-version-name
  }

  # Trusted Registry Policy (To create new change "use_existing" to 'false' and set "create_new' to 'true' uncomment variables and modify them to meet your needs.)
  # Set both variables to 'false' if this policy is not needed.
  tr_policy = {
    use_existing = false
    create_new   = false
    # name         = "trusted-registry"
  }

  # Runtime Policy (To create new change "use_existing" to 'false' and set "create_new' to 'true' uncomment variables and modify them to meet your needs.)
  # Set both variables to 'false' if this policy is not needed.
  runtime_policy = {
    use_existing = false
    create_new   = false
    # name                 = "runtime"
    # http_proxy_hostname  = "t"
    # http_proxy_port      = 80
    # http_proxy_protocol  = "http"
    # http_proxy_username  = null
    # http_proxy_password  = null
    # https_proxy_hostname = "t"
    # https_proxy_port     = 8080
    # https_proxy_protocol = "https"
    # https_proxy_username = null
    # https_proxy_password = null
  }

  # Infrastructure Configuration Policy (To create new change "use_existing" to 'false' and uncomment variables and modify them to meet your needs.)
  infraConfigPolicy = {
    use_existing = true
    #platformType = "esxi"
    policyName = "vm-infra"
    # description  = "Test Policy"
    #interfaces   = var.k8s_infra-interfaces
    #vcTargetName   = var.k8s_infra-vcenterIP
    #vcClusterName      = var.k8s_infra-clusterName
    #vcDatastoreName     = var.k8s_infra-datastoreName
    #vcPassword      = var.vc_password
  }

  # Addon Profile and Policies (To create new change "createNew" to 'true' and uncomment variables and modify them to meet your needs.)
  # This is an Optional item.  Comment or remove to not use.  Multiple addons can be configured.
  /*
  addons = [
    {
      createNew       = false
      addonPolicyName = "smm-test-cluster"
      addonName       = "smm"
      description     = "SMM Policy"
      upgradeStrategy = "AlwaysReinstall"
      installStrategy = "InstallOnly"
      releaseVersion  = "1.7.4-cisco4-helm3"
      overrides       = yamlencode({ "demoApplication" : { "enabled" : true } })
    },
    {
      createNew       = false
      addonPolicyName = "ccp-monitor"
      description     = "monitor Policy"
      # upgradeStrategy  = "AlwaysReinstall"
      # installStrategy  = "InstallOnly"
      releaseVersion = "0.2.61-helm3"
    }
  ]
*/
  # Worker Node Instance Type (To create new change "use_existing" to 'false' and uncomment variables and modify them to meet your needs.)
  instance_type = {
    use_existing = true
    name         = "vm-instance"
    #cpu          = 4
    #memory       = 16386
    #disk_size    = 40
  }

  # Organization and Tag Information
  organization = var.organization
  tags         = var.tags
}
