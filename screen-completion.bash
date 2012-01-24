#!/bin/bash
#
# bash completion script for listing screen sessions
# basically works, but certainly can use improvement
#
# Copyright Dave Dillow	10 Oct 2008
# Feel free to use this under the GPLv2 license.
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
#
# To use this, put this somewhere reachable, and add the
# following line to your .bashrc:
#	type screen &> /dev/null && source /path/to/this/file
#

_screen_extglob=$(shopt -p extglob)
shopt -s extglob

_screen_list() {
	local cmd=$1
	local cur_word=$2
	local i config screens duplicates

	# Since the user can specify a different place to put the
	# screen sockets in the config file, we need to pick up the one
	# they are using.
	#
	for (( i=0; i < ${#COMP_WORDS}; i++)); do
		[[ ${COMP_WORDS[i]} == '-c' ]] && {
			config="${COMP_WORDS[i+1]}"
			[[ $config && -r "$config" ]] || return
			config="-c '$config'"
			break
		}
	done

	local oIFS=$IFS
	IFS=$'\n'
	screens=($($cmd $config -ls | awk '
			$0 ~ "No Sockets found" { exit 1 }
			$0 !~ "There are screens on:" && 
			$0 !~ "[0-9]+ Socket(s)? in" && 
			$0 ~ "[0-9]+" { print $1 }')) || {
		COMPREPLY=()
		return
	}

	# XXX Ack! Need to detect duplicate prefixes as well!
	# When sessions test and test2 exist, 'screen -r test' will cause
	# an error
	#
	# Could just let screen bitch in this case...
	#
	duplicates=($(for i in "${screens[@]}"; do echo "$i"; done |
			xargs -n1 | cut -f2- -d. | sort | uniq -d))
	IFS=$oIFS

	# If there's only one, just do the completion and bail.
	#
	[[ ${#screens[@]} -eq 1 ]] && {
		COMPREPLY=($(compgen -W "${screens[0]}" -- "$cur_word"))
		return
	}

	# If we have more than one session with the same name, we need
	# to include the pid as well. Otherwise, we can allow a match
	# on just the session name. If the user's started typing a name,
	# then add the pid-based names as well, to allow matching against
	# them.
	#
	local filter='echo -e "\n${scr#*.}"'
	[[ $cur_word ]] && filter='echo -e "${scr}\n${scr#*.}"'
	[[ ${duplicates[@]} ]] && {
		filter=$'case "$scr" in\n'
		for i in "${duplicates[@]}"; do
			filter="${filter}+([0-9]).$i) "
			filter="${filter}echo "'"$scr";;'$'\n'
		done
		filter="${filter}*) echo -e "'"${scr}\n${scr#*.}";;'
		filter="${filter}"$'\n'"esac"
	}

	local words
	words=$(for scr in "${screens[@]}"; do eval "$filter"; done)

	# XXX It'd be nice to put the pid-prefixed words at the end of
	# XXX the list...
	COMPREPLY=($(compgen -W "$words" -- "$cur_word"))
}

_screen() {
	local cmd=$1
	local cur_word=$2
	local prev_word=$3
	local prev_glob=$(shopt -p extglob)

	# Make sure we're in the path, since we need to run screen to
	# generate a list. If not, pretend we don't exist.
	#
	type "$cmd" &> /dev/null || {
		COMPREPLY=($(compgen -o default -- "$cur_word"))
		return;
	}

	shopt -s extglob

	case "$prev_word" in
	-+([dDrR]))	_screen_list "$cmd" "$cur_word" ;;
	*)		COMPREPLY=($(compgen -o default -- "$cur_word")) ;;
	esac

	eval "${prev_glob}"
	return 0
}

eval "${_screen_extglob}"
unset _screen_extglob

complete -F _screen screen
