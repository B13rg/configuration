# Quick commands
alias c='clear'
alias l.='ls -d .* --color=auto'
alias la='ls -alF --color=auto'
alias ll='ls -lF --color=auto'
alias ls='ls --color=auto'
alias l='ls -CF'
alias vi='vim'

# grepy stuff
alias grep='grep --color=auto'
alias egrep='egrep --color=autp'
alias fgrep='fgrep --color=auto'

# Make all parent directories
# Example: `mkdir /parent/child/foo`
alias mkdir='mkdir -pv'

# Better diff
alias diff='diff -syt'

# Better cd commands
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'

# Safer rm
alias rm='rm -I --preserve-root'

# Show cheatsheet
alias chtsht='less ~/cheatsheet.txt'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
