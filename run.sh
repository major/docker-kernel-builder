#!/bin/bash

cat << 'EOF'
 _                        _   _           _ _     _
| | _____ _ __ _ __   ___| | | |__  _   _(_) | __| | ___ _ __
| |/ / _ \ '__| '_ \ / _ \ | | '_ \| | | | | |/ _` |/ _ \ '__|
|   <  __/ |  | | | |  __/ | | |_) | |_| | | | (_| |  __/ |
|_|\_\___|_|  |_| |_|\___|_| |_.__/ \__,_|_|_|\__,_|\___|_|

EOF


# Install Ansible
echo "Installing Ansible..."
wget --quiet --output-document=/opt/get-pip.py \
    https://bootstrap.pypa.io/get-pip.py
python /opt/get-pip.py
pip install ansible

# Clone Ansible playbook from git and run it
echo "Executing playbook..."
export DKB_DIR=/opt/docker-kernel-builder
git clone https://github.com/major/docker-kernel-builder $DKB_DIR
ansible-playbook -i ${DKB_DIR}/ansible/hosts.txt ${DKB_DIR}/ansible/playbook.yml
