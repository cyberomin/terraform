variable "token" {
    default = "xxxxxx-xxx-xxx-xxxxx"
}

provider "digitalocean" {
    token = "${var.token}"
}

resource "digitalocean_droplet" "web" {
    image = "ubuntu-16-04-x64"
    name = "web-1"
    region = "lon1"
    size = "1gb"   
}

output "ip" {
    value = "${digitalocean_droplet.web.ipv4_address}"
}
