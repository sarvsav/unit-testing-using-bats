#!/usr/bin/env bash

function greet() {
    printf "Welcome, %s\n" "$1"
}

function bye() {
    printf "Have a nice day, %s!\n" "$1"
}

function showuser() {
    curl https://api.github.com/users/"$1" 2>/dev/null | grep "\"name\"" | awk -F: '{print $2}' | tr -d -- "\","
}

function main() {
    # Should be replaced by getopts
    case "$1" in
	greet)
		greet "$2"
		;;
	bye)
		bye "$2"
		;;
    details)
        showuser "$2"
        ;;
	*)
		echo "Sorry, I don't understand"
		;;
  esac
}

## A comparison operator can also be used, however the `-ef` gives more 
## confidence.
## file1 -ef file2
## True if file1 and file2 refer to the same device and inode numbers.
if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
  main "$@" # To pass the argument list
fi
