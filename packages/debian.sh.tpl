#!/bin/sh
sudo apt update

sudo apt install \
{%- for pkg in packages.apt %}
{{ pkg }} \
{%- endfor %}

#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# brew install
