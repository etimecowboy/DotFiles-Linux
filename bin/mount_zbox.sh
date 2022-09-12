#!/bin/bash
sshfs -o IdentityFile=~/.ssh/id_rsa xin@zbox:/home/xin/ ~/zbox_sshfs/xin
sshfs -o IdentityFile=~/.ssh/id_rsa xin@zbox:/mnt/data/xin/ ~/zbox_sshfs/data
sshfs -o IdentityFile=~/.ssh/id_rsa xin@zbox:/mnt/ext1/xin/ ~/zbox_sshfs/ext1
sshfs -o IdentityFile=~/.ssh/id_rsa xin@zbox:/mnt/ext2/xin/ ~/zbox_sshfs/ext2
