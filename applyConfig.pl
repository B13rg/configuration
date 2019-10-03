#!/usr/bin/perl
use strict;
use warnings;
use File::Basename qw/dirname/;
use File::Copy;
use File::Path;

use Data::Dumper;

my $source_dir = "./";
my $target_dir = $ENV{'HOME'} . '/';
my $configFile = "./config/filePaths.csv";

if($#ARGV+1==0) {
	RunAll();
}else {
	my @types;
	foreach (@ARGV){
		if($_ eq "-bash") { push @types, 'bash'; }
		elsif($_ eq "-git") { push @types, 'git'; }
		elsif($_ eq "-tmux")  { push @types, 'tmux'; }
		elsif($_ eq "-vim") { push @types, 'vim'; }
		elsif($_ eq "-ssh") { push @types, 'ssh'; }
		else {exit}
	}
	RunList( @types );
}

sub RunAll {
	open(DATA, '<', $configFile);
	my @lines = <DATA>;
	close DATA;
	foreach (@lines) {
		if ($_ =~ m/^#/ || $_ =~ /^\s*$/) { next; }	# Starts with hash or is blank
		copyFile( split /,/,$_ );
	}
	print "Complete: run `reload` to apply bash changes\n"
}

sub RunList {
	my @typeList = @_;
	open(DATA, '<', $configFile);
	my @files = <DATA>;
	close DATA;
	foreach $line (@files) {
		if (grep { $line =~ m/^$_/ } @typeList) { copyFile( split /,/,$line ) }
	}
}

sub copyFile {
	my $src = shift;
	my $dest = shift;
	$src = $source_dir . $src;
	$dest = $target_dir . $dest;
	chomp $src;
	chomp $dest;
	if(-f "$src") {
		print "Moving $src to $dest\n";
		mkpath(dirname("$dest")) if not -d dirname("$dest");
		copy ("$src", "$dest");
	}
}
