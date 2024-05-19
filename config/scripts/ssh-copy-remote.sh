#!/bin/sh
# Copies SSH key $1 to a target host $2
ssh-copy-id -i $1 $2
