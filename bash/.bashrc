# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Configure programs
export EDITOR=vim
export PAGER=most
export BROWSER=lynx

# Make options
export MAKEOPTS=-j3
# Shell options
# 	Make ** in a pathname expansion context to match all files and zero or more
#	directories or subdirectories
shopt -s globstar

# Aliases
alias stow='xstow'
alias gitaddsub='git submodule add'
alias vpdf='mupdf-gl'
alias make='make -j3'

# Enviroment variables
export CC=colorgcc

# Completion
# Complete based off of existing commands
complete -c man
complete -c which
complete -c foreach

# Source bash functions
source ~/.bash/functions.sh
