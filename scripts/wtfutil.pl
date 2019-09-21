#!/usr/bin/perl

use warnings;
use strict;

`wget -O ./tmp/wtf_0.22.0_linux_amd64.tar.gz https://github.com/wtfutil/wtf/releases/download/v0.22.0/wtf_0.22.0_linux_amd64.tar.gz`;
`tar xzf ./tmp/wtf_0.22.0_linux_amd64.tar.gz`;

`chmod a+x ./wtf_0.22.0_linux_amd64/wtfutil`;
`cp ./wtf_0.22.0_linux_amd64/wtfutil /usr/local/bin/`;

`rm -rf ./tmp`
