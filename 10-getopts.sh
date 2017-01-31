#!/bin/sh

parse () {
	# global variable set by getopts if not reset the second run
	# does not start as beginning
	OPTIND=0
	while getopts ":dh" OPTION
	do
		case $OPTION in
			d)
				# beware you need local here otherwise strange behavior appears
				local DEBUG=
				;;
			h)
				echo "show help"
				return 0
				;;
			[?])
				echo "Invalid option '-$OPTARG'"
				return 1
				;;
		esac
	done

	# Remove options from arguments
	shift $((OPTIND-1))
	# How to set a debug flag
	[ ! -z ${DEBUG+x} ] && set -x
	echo "$1"
	set +x
	return 0
}

if parse -d "foo"
then
	echo "first run with debug ok"
fi
echo "---"

if ! parse -t "foo"
then
	echo "second incorrect run detected"
fi
