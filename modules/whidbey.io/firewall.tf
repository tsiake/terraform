resource "vultr_firewall_group" "whidbey_firewall" {
    description = "whidbey_firewall"
}

resource "vultr_firewall_rule" "whidbey_firewall_rule" {
    firewall_group_id = vultr_firewall_group.whidbey_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "80"
}

resource "vultr_firewall_rule" "https_firewall_rule" {
    firewall_group_id = vultr_firewall_group.whidbey_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "443"
}

resource "vultr_firewall_rule" "ssh_firewall_rule" {
    firewall_group_id = vultr_firewall_group.whidbey_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "55522"
}

resource "vultr_firewall_rule" "mongo_firewall_rule" {
    firewall_group_id = vultr_firewall_group.whidbey_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "27017"
}
