resource "null_resource" "null01" {

    provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${path.module}/hosts ${path.module}/ansible-data/playbooks/install-tree.yml"
  }
}
