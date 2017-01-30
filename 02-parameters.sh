#!/bin/sh

FOO="foo bar baz"

echo_params () {
	echo "$1"
	echo "$2"
	echo "$3"
}

consume_params () {
	# shift keyword consume parameters, this can be interesting for sequential
	# parsing
	echo $1
	shift
	echo $1
	shift
	echo $1
}

echo_all () {
	echo "${@}"
	echo "${*}"
}

iteration () {
	for p in "${@}"
	do
		echo "$p"
	done
}

iteration_without_quote () {
	for p in ${@}
	do
		echo "$p"
	done
}

echo_params $FOO
consume_params $FOO
echo "---"
echo_all $FOO
echo "---"

# Here something interesting
iteration $FOO
iteration "$FOO"

echo "---"

iteration_without_quote $FOO
iteration_without_quote "$FOO"
