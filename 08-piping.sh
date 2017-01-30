#!/bin/sh

for line in "foo" "bar" "baz"
do
	echo "$line"
done | while read line
do
	echo "Reading from pipe $line"
done | while read line
do
	echo "$line, continue..."
done
