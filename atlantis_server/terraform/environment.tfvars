project_id            = "vinted-testavimui"
backend_bucket        = "vinted-bucket"
vpc                   = "my-vpc"
subnet_name           = "my-subnet"
cidr_range            = "10.0.1.0/24"
atlantis_source_range = ["0.0.0.0/0"]
ssh_source_range      = ["0.0.0.0/0"]
image_name            = "ubuntu-os-cloud/ubuntu-2004-lts"
machine_type          = "e2-standard-4"
zone                  = "europe-west2-a"
service_account_email = "terraform21423@vinted-testavimui.iam.gserviceaccount.com"
region                = "europe-west2"