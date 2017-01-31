#!/bin/sh

# Really simple one, can be convenient
echo foo.{bar,baz}
echo "---"

# Also can be used for default variable values
echo ${FOO:-"default"}
FOO="foo"
echo ${FOO:-"default"}

echo "---"

# Templating test
cat << EOF
foo.{bar,baz}     # not working
$(echo foo.{bar,baz})   # working
${BAR:-"default"}           # working
EOF
