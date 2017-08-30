#!/bin/bash
# Restow.sh - Add all new files to their stowed locations

for dir in astyle, bash, dillo, dunst, git, idesk, mutt, screen, tmux, vim, x, xdock; do
	xstow dir
done
