provider "vultr" {
    api_key = "NON2KYATVRBHNLSTKQ4NL2EGRXKLEEYMFS6Q"
    rate_limit  = 700
    retry_limit = 3
}

# instantiate webserver
resource "vultr_server" "web" {
    plan_id = "201"
    region_id   = "25"
    os_id = "381"
    label = var.label
    tag = var.tag
    hostname = var.hostname
    ssh_key_ids = ["${data.vultr_ssh_key.terraform_key.id}"]
    firewall_group_id = vultr_firewall_group.web_firewall.id

    # copy all of our files to /tmp
    provisioner "file" {
        source = "files/"
        destination = "/tmp/"
        connection {
            type = "ssh"
            user = "root"
            host = vultr_server.web.main_ip
            password = vultr_server.web.default_password
        }

    }

    # setup nginx, certbot
    provisioner "remote-exec" {
        inline = [
            "bash /tmp/setup.sh",
            "echo 'nginx & cert setup complete...'"
        ]

        connection {
            type = "ssh"
            user = "root"
            host = vultr_server.web.main_ip
            password = vultr_server.web.default_password
        }
    }

}
