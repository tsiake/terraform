data "vultr_ssh_key" "terraform_key" {
    filter {
        name = "name"
        values = ["terraform_key"]
    }
}
