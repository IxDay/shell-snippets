#!/bin/sh

tmpfile=$(mktemp)
trap "rm $tmpfile" EXIT

# Use of subshells allow to perform some anonymous function stuff which can be
# convenient, line break is not taken in account, you have to manually place ";"
{
	echo "foo";
	if /usr/bin/true;
	then
		echo "bar";
	fi
} > "$tmpfile"

cat "$tmpfile"
