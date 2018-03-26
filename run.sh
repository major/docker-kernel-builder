#!/bin/bash

# Install Ansible
wget --quiet --output-document=/opt/get-pip.py \
    https://bootstrap.pypa.io/get-pip.py
python /opt/get-pip.py
pip install ansible

# Clone Ansible playbook from git and run it
export DKB_DIR=/opt/docker-kernel-builder
git clone https://github.com/major/docker-kernel-builder $DKB_DIR
ansible-playbook -i ${DKB_DIR}/ansible/hosts.txt ${DKB_DIR}/ansible/playbook.yml
