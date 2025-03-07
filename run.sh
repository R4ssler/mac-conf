#!/bin/bash

if ! type "pip" > /dev/null; then
  sudo easy_install pip
else
  sudo curl https://bootstrap.pypa.io/get-pip.py | sudo python
fi

if ! type "ansible" > /dev/null; then
  sudo -H pip install ansible
fi

git submodule update --remote --init

ansible-galaxy install -r requirements.yml
ansible-playbook desktop.yml $*
