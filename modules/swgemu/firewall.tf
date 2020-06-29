resource "vultr_firewall_group" "swgemu_firewall" {
    description = "swgemu_firewall"
}

resource "vultr_firewall_rule" "swgemu_login_firewall_rule" {
    firewall_group_id = vultr_firewall_group.swgemu_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "44453"
}

resource "vultr_firewall_rule" "ssh_firewall_rule" {
    firewall_group_id = vultr_firewall_group.swgemu_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "22"
}

resource "vultr_firewall_rule" "orb_firewall_rule" {
    firewall_group_id = vultr_firewall_group.swgemu_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "44419"
}

resource "vultr_firewall_rule" "status_firewall_rule" {
    firewall_group_id = vultr_firewall_group.swgemu_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "44455"
}

resource "vultr_firewall_rule" "web_firewall_rule" {
    firewall_group_id = vultr_firewall_group.swgemu_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "44460"
}

resource "vultr_firewall_rule" "ping_firewall_rule" {
    firewall_group_id = vultr_firewall_group.swgemu_firewall.id
    protocol = "tcp"
    network = "0.0.0.0/0"
    from_port = "44462"
}
