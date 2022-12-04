resource "null_resource" "null01" {
     triggers = {
    always_run = "${timestamp()}"
     }
    provisioner "local-exec" {
    environment = {
      key_status = ${var.vmPassword}
    }
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${path.module}/hosts ${path.module}/ansible-data/playbooks/install-tree.yml"
  }
}


variable "vmPassword" {
}
