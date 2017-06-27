variable "token" {
  default = "xxxx-xxxxx-xxxx-xxxx-xxxx"
}

provider "digitalocean" {
  token = "${var.token}"
}

resource "digitalocean_ssh_key" "default" {
  name       = "SSH Key Credential"
  public_key = "${file("/home/vagrant/.ssh/id_rsa.pub")}"
}

resource "digitalocean_droplet" "web" {
  count    = 2
  image    = "ubuntu-16-04-x64"
  name     = "web-${count.index}"
  region   = "lon1"
  size     = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "digitalocean_droplet" "database" {
  image    = "ubuntu-16-04-x64"
  name     = "db-1"
  region   = "lon1"
  size     = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "digitalocean_loadbalancer" "public_lb" {
  name   = "public-lb"
  region = "lon1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  algorithm   = "round_robin"
  droplet_ids = ["${digitalocean_droplet.web.*.id}"]
}

output "loadbalancer_ip" {
  value = "${digitalocean_loadbalancer.public_lb.ip}"
}
