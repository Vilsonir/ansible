#!/bin/bash
#
# Add id_rsa.pub to user devops on managed hosts
#
#
set -x

LIST=$(grep home.mynet /home/devops/ansible-mgmt/inventory)

for item in $LIST
do
  sudo sshpass -f  '/home/devops/.mydevops_pass.txt' ssh-copy-id -i '/home/devops/.ssh/id_rsa.pub'  -o 'StrictHostKeyChecking no' devops@$item 
done
