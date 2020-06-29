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
    user_data = file("userdata.sh")

    # get the public IP
    provisioner "local-exec" {
        command = "echo ${vultr_server.web.main_ip} > external_ip"
    }

    # upload a dummy index page
    provisioner "file" {
        source = "upload"
        destination = "/home/web"
    }
}
