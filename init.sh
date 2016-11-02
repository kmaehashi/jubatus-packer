#!/bin/bash -uex

# Wait for cloud-init to complete when building AMI.
while [ "$PACKER_BUILDER_TYPE" = "amazon-ebs" -a ! -f /var/lib/cloud/instance/boot-finished ]; do
  echo 'Waiting for cloud-init...';
  sleep 1;
done

sudo -E apt-get -y update
sudo -E apt-get -y install software-properties-common aptitude
sudo -E apt-add-repository -y ppa:ansible/ansible
sudo -E apt-get -y update
sudo -E apt-get -y install ansible
