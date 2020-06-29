variable "label" {
    description = "The label assigned to the server"
    type    = string
    default = "webserver"
}

variable "tag" {
    description = "The tag assigned to the server"
    type    = string
    default = "infra"
}

variable "hostname" {
    description = "The server hostname"
    type = string
    default = "webserver"
}

variable "ssh_key" {
    description = "Name of the SSH key"
    type = string
    default = "terraform_key"
}
