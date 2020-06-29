resource "vultr_firewall_group" "web_firewall" {
    description = "web_firewall"
}

resource "vultr_firewall_rule" "web_firewall_rule" {
    firewall_group_id = vultr_firewall_group.web_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "80"
}
