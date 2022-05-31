#!/bin/bash
#
#

if [ -z $1 ]
then
    exit 1
fi

ssh root@$1 'useradd -d /home/devops devops'
ssh root@$1 'mkdir -p /home/devops/.ssh'
scp /home/devops/.ssh/id_rsa.pub root@$1:/home/devops/.ssh/authorized_keys
ssh root@$1 'chown -R devops.devops /home/devops'
ssh root@$1 'apt -y update'
ssh root@$1 'apt install sudo -y'
ssh root@$1 'echo "devops	ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/devops'
