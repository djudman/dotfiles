#!/bin/bash

if [ -d ~/pets/ansible ]
then
    source ~/pets/ansible/venv/bin/activate
    eval $(register-python-argcomplete ansible)
    eval $(register-python-argcomplete ansible-config)
    eval $(register-python-argcomplete ansible-console)
    eval $(register-python-argcomplete ansible-doc)
    eval $(register-python-argcomplete ansible-galaxy)
    eval $(register-python-argcomplete ansible-inventory)
    eval $(register-python-argcomplete ansible-playbook)
    eval $(register-python-argcomplete ansible-pull)
    eval $(register-python-argcomplete ansible-vault)
fi