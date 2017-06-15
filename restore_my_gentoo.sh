#!/bin/sh
# Author: Martin Vassor
# Description: Restore all user modified files of the system (for gentoo) from an archive created with save_my_gentoo.sh
# Creation date: 15-06-2017
# Last modified: jeu. 15 juin 2017 22:56:12 CEST
# Known bugs: 

print_help() {
	echo "Usage: $0 archive_name"
}

main() {
	if [ $# -ne 1 ]; then 
		print_help;
		exit -1;
	fi

	DIR="/"
	
	echo "The directory prefix is: $DIR"
	tar x --file="$1" --directory="$DIR" --overwrite --preserve-permissions --interactive
}

main $1

: <<=cut

=pod

=head1 NAME

restore_my_gentoo.sh - Restore user modified files of a gentoo system (world, etc.).

=head1 SYNOPSIS

Usage: C<./restore_my_gentoo.sh archive_name>

=head1 NOTE

archive_name should be an archive produced by C<save_my_gentoo.sh>

=head1 AUTHOR
 
Martin Vassor

=cut
