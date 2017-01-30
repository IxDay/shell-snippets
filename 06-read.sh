#!/bin/sh

# http://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable

tmpfile=$(mktemp)
trap "rm $tmpfile" EXIT

cat > "$tmpfile" << EOF
line 1
line 2
line 3
EOF

while read -r line
do
	echo "$line"
done < "$tmpfile"

echo "---"

# pipe from another process
head -n 2 "$tmpfile" | while read line
do
	echo "$line"
done
