#!/bin/sh
# Author: Martin Vassor
# Description: Save all user modified files of the system (for gentoo), so he can have a similar system on an other computer
# Creation date: 14-06-2017
# Last modified: mer. 14 juin 2017 22:20:57 CEST
# Known bugs: 

print_help() {
	echo "Usage: $0"
}

save_file() {
	if [ -e "$ARCHIVE" ]; then 
		tar -r -f "$ARCHIVE" "$1" 
	else 
		tar -c -f "$ARCHIVE" "$1"
	fi
}

getfile() {
	FILES=$(grep "FILES" "$(basename $0)" | tail -n 1 | cut -d = -f 2)
}

main() {
	ARCHIVE="$(mktemp -u)"

	getfile
	if [ ! -e $FILES ]; then
		echo "The config file '$FILES' does not exist." 1>&2
		exit -1
	fi

	for LINE in $(cat $FILES); do 
		save_file "$LINE"
	done

	if [ -e "$ARCHIVE" ]; then 
		gzip -c "$ARCHIVE" > my_gentoo.tar.gz
		rm "$ARCHIVE"
	fi
}

main

: <<config

FILES=./gentoo_files

config

: <<=cut

=pod

=head1 NAME

save_my_gentoo

=head1 SYNOPSIS

./save_my_gentoo.sh

=head1 AUTHOR

Martin Vassor

=cut

