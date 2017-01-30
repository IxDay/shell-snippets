#!/bin/sh

# http://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash#answer-13864829

[ -z ${DEBUG+x} ] && echo "will be displayed"

DEBUG=

[ -z ${DEBUG+x} ] && echo "will NOT be displayed"
[ ! -z ${DEBUG+x} ] && echo "will be displayed"

echo "---"
# You can assign and test a command at the same time
tmpfile=$(mktemp)
trap "rm $tmpfile" EXIT

if result=$(grep "foo" "$tmpfile" 2> /dev/null)
then
	echo "will NOT be displayed"
fi

echo "foo bar" > "$tmpfile"
if result=$(grep "foo" "$tmpfile" 2> /dev/null)
then
	echo "will be displayed, \$result initialized: '$result'"
fi

echo "---"

# http://ss64.com/bash/test.html
# String tests
# These options test string characteristics. Strings are not quoted for `test',
# though you can quote them to protect characters with special meaning to the
# shell, e.g., spaces.
#
# `-z String'
#     True if the length of String is zero.
#
# `-n String'
# `String'
#     True if the length of String is nonzero.
#
# `String1 = String2'
#     True if the strings are equal.
#
# `String1 != String2'
#     True if the strings are not equal.
read FOO BAR BAZ <<< "foo bar baz"
([ -z "$FOO" ] || [ ! -z "$BAR" ]) && [ -n "$BAZ" ] && echo "will be displayed"
