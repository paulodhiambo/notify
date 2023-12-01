#!/bin/bash

set -e

echo "Deploying the application using Ansible..."

ansible-playbook -i ansible/inventory/production/hosts ansible/playbook.yml

echo "Deployment completed successfully."
