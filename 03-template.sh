#!/bin/sh

# Create a bash template, which can be injected in a file or in a variable

# BEWARE: the indentation here is really important, difference between tabs
# and spaces is really important in schell scripts

FOO="foo"
BAR="bar"

tmpfile=$(mktemp)

cat > "$tmpfile" << EOF
testing templating $FOO, ${BAR}s
EOF

# Concatenation
cat >> "$tmpfile" << EOF
adding more informations
EOF

cat "$tmpfile"
rm "$tmpfile"

echo "---"
# Also works for variables (-r backslash does not act as an escape character)
read -r -d '' VAR << EOF
testing templating $FOO, ${BAR}s
EOF


# Concatenation
read -r -d '' VAR << EOF
$VAR
adding more informations
EOF

echo "$VAR"
echo "---"

# multiline echo
cat << EOF
multiline echo is also easy
(this is second line)
EOF

echo "---"

# function usage
func () {
	# beware of the EOF
	read -r -d '' VAR << EOF
testing templating $FOO, ${BAR}s, function variable
EOF

	echo "$VAR"
	# tabs are stripped, the <<- allows you to indent the end delimiter
	read -r -d '' VAR <<- EOF
		testing templating $FOO, ${BAR}s, tab are stripped
	EOF
	echo "$VAR"

	# but can be injected if needed or use spaces (be carefull with your shell)
	read -r -d '' VAR <<- EOF
		\n\ttesting templating $FOO, ${BAR}s, can inject tab, line break characters
		    space indent
	EOF
	echo "$VAR"
}

func
