module "firewall_jacopen" {
  source  = "app.terraform.io/broadleaf/firewall-jacopen/gcp"
  version = "0.0.1"

  network_name = "default"
  project_id = "jacopen-project"
	rules = [{
    name                    = "allow-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}
