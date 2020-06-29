variable "label" {
    description = "The label assigned to the server"
    type    = string
    default = "swgemu"
}

variable "tag" {
    description = "The tag assigned to the server"
    type    = string
    default = "infra"
}

variable "hostname" {
    description = "The server hostname"
    type = string
    default = "swgemu"
}

variable "ssh_key" {
    description = "Name of the SSH key"
    type = string
    default = "terraform_key"
}

variable "new_password" {
    description = "new mysql password"
    type = string
    default = "new"
}

varialbe "snapshot" {
    description = "snapshot on vultr"
    type = string
    default = "3015ef4e4e613"
}
