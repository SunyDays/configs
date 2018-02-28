#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

unalias -a
alias ll='ls -lh'
alias la='ls -lah'
alias diff='diff --color=auto'
alias g='git'
alias grni='grep --color=auto -rnI'
alias grnii='grep --color=auto -rnIi'
# unalias emacs

alias uncl='unclutter -idle 1 -jitter 10 -root &'
alias telegram-cli='telegram-cli -k /etc/telegram-cli/server.pub -N'
export EDITOR='emacs'

PS="[\u@\W]\$"
PS1="\[\e[0;32m\]$PS \[\e[m\]"
PS2='>>> '
PS3='>> '
PS4='> '

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
