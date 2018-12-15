#!/bin/bash

ANSIBLE_PLAYBOOK=$1
VERBOSE=$2

sudo chmod 777 /var/www

echo $ANSIBLE_PLAYBOOK;
ls -la $ANSIBLE_PLAYBOOK


if [ ! -f $ANSIBLE_PLAYBOOK ]; then
    echo "Cannot find Ansible playbook"
fi

echo "Running Ansible"
sudo ansible-playbook $VERBOSE ${ANSIBLE_PLAYBOOK}  -i 'localhost,' --connection=local
