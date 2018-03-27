#!/bin/bash

cat << 'EOF'
 _                        _   _           _ _     _
| | _____ _ __ _ __   ___| | | |__  _   _(_) | __| | ___ _ __
| |/ / _ \ '__| '_ \ / _ \ | | '_ \| | | | | |/ _` |/ _ \ '__|
|   <  __/ |  | | | |  __/ | | |_) | |_| | | | (_| |  __/ |
|_|\_\___|_|  |_| |_|\___|_| |_.__/ \__,_|_|_|\__,_|\___|_|

EOF

# Clone Ansible playbook from git and run it
echo "Executing playbook..."
export DKB_DIR=/opt/docker-kernel-builder
export ANSIBLE_CALLBACK_WHITELIST=profile_tasks
git clone https://github.com/major/docker-kernel-builder $DKB_DIR
cd ${DKB_DIR}/ansible
ansible-playbook -i hosts.txt playbook.yml
