#!/bin/bash
sudo -E apt-add-repository ppa:ansible/ansible
sudo apt install ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
ansible --version