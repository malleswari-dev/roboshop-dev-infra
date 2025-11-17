#!/bin/bash
dnf install ansible -y
ansible-pull -U https://github.com/malleswari-dev/ansible-roboshop-roles-tf.git -e component=mongodb main.yml