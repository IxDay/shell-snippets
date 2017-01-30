#!/bin/sh

# this shows how you can provide the value of a variable to a command without
# echo-pipe it

FOO="foo bar baz"
grep bar <<< "$FOO"

# this also works
grep bar <<< "foo bar baz"
