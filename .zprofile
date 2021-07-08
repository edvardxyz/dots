#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

# Adds directories to $PATH
export PATH="$PATH:$HOME/.local/bin/"


# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export ZDOTDIR=~/.config/zsh/
export LESSHISTFILE=~/.cache/less/.lesshst

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx

