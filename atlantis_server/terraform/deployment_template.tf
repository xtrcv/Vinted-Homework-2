data "template_file" "startup_script" {
  template = file("${path.module}/playbook/startup.tpl")
  vars = {
    atlantis_ansible_bucket_url = "gs://${google_storage_bucket.atlantis_ansible_bucket.name}/atlantis_ansible"
  }
  depends_on = [google_storage_bucket.atlantis_ansible_bucket]

}
