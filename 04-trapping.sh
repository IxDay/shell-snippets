#!/bin/sh

hello () {
	echo "Hello $1!, finishing"
}

trap "hello 'foo bar'" ERR EXIT
