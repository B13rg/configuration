#!/bin/sh

while read line; do
	tmux set-buffer "$line"
done < ~/.tmux/clipboard.txt
