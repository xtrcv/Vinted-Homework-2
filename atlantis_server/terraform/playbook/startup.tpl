#!/bin/bash
set -e

# Install Ansible and dependencies
sudo apt-get install -y software-properties-common
# Install required Python libraries
sudo apt-get update && sudo apt-get install -y python3-pip
sudo pip3 install google-auth google-auth-oauthlib google-auth-httplib2

# Install Ansible and required collections
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible
ansible-galaxy collection install google.cloud

# Use this variable for the atlantis_ansible_bucket_url in your script
ATLANTIS_ANSIBLE_BUCKET_URL="${atlantis_ansible_bucket_url}"

# Debug: Print Ansible version and installed collections
ansible --version
ansible-galaxy collection list

# Set up the project directory
mkdir -p /opt/atlantis_project
cd /opt/atlantis_project

# Download the Atlantis project from your repository
sudo gsutil cp -r "$ATLANTIS_ANSIBLE_BUCKET_URL" .

cd atlantis_ansible
ansible-inventory -i gcp_compute.yml --list
# Execute the Ansible playbook
sudo ansible-playbook atlantis_playbook.yml
