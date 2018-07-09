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

if [ ! -z "$DVTM" ] ; then
	# Set the right terminal type
	export TERM=dvtm-256color;
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
alias wm='dtach -A /tmp/dvtm -r winch dvtm'

# Enviroment variables
export CC=colorgcc

# Completion
# Complete based off of existing commands
complete -c man
complete -c which
complete -c foreach

# Source bash functions
source ~/.bash/functions.sh

PATH="/home/ben/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ben/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ben/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ben/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ben/perl5"; export PERL_MM_OPT;
