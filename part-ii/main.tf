variable "token" {
  default = "xxxx-xxxxx-xxxx-xxxx-xxxx"
}

provider "digitalocean" {
  token = "${var.token}"
}

resource "digitalocean_ssh_key" "default" {
  name = "SSH Key Credential"
  public_key = "${file("/home/vagrant/.ssh/id_rsa.pub")}"
}

resource "digitalocean_droplet" "web" {
  image = "ubuntu-16-04-x64"
  name = "web-1"
  count = 2
  region = "lon1"
  size = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "digitalocean_droplet" "database" {
  image = "ubuntu-16-04-x64"
  name = "web-1"
  region = "lon1"
  size = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "digitalocean_loadbalancer" "public_lb" {
  name = "web-lb"
  region = "lon1"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }
    
  algorithm = "round_robin"
  droplet_ids = ["${digitalocean_droplet.web.id}"]
}

output "loadbalancer_ip" {
  value = "${digitalocean_loadbalancer.public_lb.ip}"
}