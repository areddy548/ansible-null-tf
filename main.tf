data "template_file" "userdata" {
  template = file("${path.module}/hosts.tpl")
  vars = {
    key_status = var.vmPassword
  }
}

resource "local_file" "foo" {
    content  = data.template_file.userdata.rendered
    filename = "${path.module}/hosts"
}

resource "null_resource" "null01" {
  
  depends_on = [
    local_file.foo
  ]
     triggers = {
    always_run = "${timestamp()}"
     }
    provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${path.module}/hosts ${path.module}/yumupdate.yml --tags \"cis.6,cis.6.1.2\""
  }
}

variable "vmPassword" {
}
