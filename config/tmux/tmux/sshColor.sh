#!/bin/sh

# In ssh config:
# PermitLocalCommand=yes
# LocalCommand="sshColor.sh" "<param>"
#
# Examples:
#  sshColor.sh bg=colour16
#  sshColor.sh bg=colour52
#  sshColor.sh bg=default
#
# Good colors: 16, 17, 23, 52, 53, 233, 234
#
# View available colors:
# for i in {0..255}; do
#  printf '\x1b[38;5;%dmcolour%d\x1b[0m\n' $i $i
# done
#



[ -z "$TMUX_PANE" ] && exit
[ "$#" -eq 1 ] || exit 1

newstyle="$1"
oldstyle="$(tmux select-pane -g -t "$TMUX_PANE")"

tmux select-pane -P "$newstyle" -t "$TMUX_PANE"

( tail --pid="$PPID" -f /dev/null
  tmux select-pane -P "$oldstyle" -t "$TMUX_PANE" ) &
