#!/bin/sh

QUX="foo bar baz"

read FOO BAR BAZ <<< "$QUX"

echo "$FOO"
echo "$BAR"
echo "$BAZ"
