#!/bin/bash
# Restow.sh - Add all new files to their stowed locations

for dir in astyle, bash, git, mutt, screen, tmux, vim, x; do
	stow dir
done
