#!/bin/sh

# All examples from this fantastic page: http://www.tldp.org/LDP/abs/html/quotingvar.html
# Quoting variables is really important in bash, here are a few examples

FOO="foo bar baz" # without quoting, this will not work

for i in $FOO
do
	echo "$i"
done

for i in "$FOO"
do
	echo "$i"
done


echo "---"
# here another demonstration
echo_func () {
	echo "$1"
}

echo_func $FOO
echo_func "$FOO"


echo "---"
# what if I want to put an s at the end of foo
FOO="foo"
echo "${FOO}s"
