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
	vim => ["vim/vimrc","vim/indent/python.vim","vim/indent/yaml.vim"],
	other => ["cheatsheet.txt"],
);

if($#ARGV+1==0) {
	foreach my $dir (keys(%filesHidden)) {
		applyList($dir,@{$filesHidden{$dir}});
	}
}else {
	foreach (@ARGV){
		if($_ eq "-bash") {applyList("bash", @{$filesHidden{bash}});}
		elsif($_ eq "-git") {applyHiddenFiles("git", @{$filesHidden{git}});}
		elsif($_ eq "-tmux")  {applyHiddenFiles("tmux", @{$filesHidden{tmux}});}
		elsif($_ eq "-vim") {applyHiddenFiles("vim", @{$filesHidden{vim}});}
		else {exit}
	}
}

sub applyList {
	my $dir = shift;
	my @list = shift;
	foreach (@list) {
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

