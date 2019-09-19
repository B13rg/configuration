#!/usr/bin/perl
use strict;
use warnings;
use File::Basename qw/dirname/;
use File::Copy;
use File::Path;

my $source_dir = ".";
my $target_dir = "/home/bbyers";

my %filesHidden = (
	bash => ["bash_aliases","bashrc"],
	git => ["gitconfig"],
	tmux => ["tmux.conf","tmux/session1"],
	vim => ["viminfo","vim/vimrc","vim/indent/python.vim","vim/indent/yaml.vim"],
	other => ["cheatsheet.txt"],
);

foreach my $dir (keys(%filesHidden)) {
	print "Moving files for $dir\n";
	foreach (@{$filesHidden{$dir}}) {
		applyHiddenFiles($dir, $_);
	}
}

sub applyHiddenFiles {
	my $directory = shift;
	my $file = shift;
	if(-f "$source_dir/$directory/$file") {
		print "Moving $source_dir/$directory/$file to $target_dir/.$file\n";
		mkpath(dirname("$target_dir/.$file")) if not -d dirname("$target_dir/.$file");
		copy ("$source_dir/$directory/$file", "$target_dir/.$file");
	}
}


