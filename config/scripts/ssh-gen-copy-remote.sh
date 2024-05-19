#!/bin/sh
# Log output to console. $1: id $2: user@Hostname
ssh-keygen -t ed25519 -f ~/.ssh/$1_ed25519
ssh-copy-id -i ~/.ssh/$1_ed25519 $2
