#!/bin/bash

# Ejecutar el playbook 1 (podman)
ansible-playbook -i hosts playbooks/playbook_podman.yml

# Ejecutar el playbook 2 (aks)
ansible-playbook -i hosts playbooks/playbook_aks.yml