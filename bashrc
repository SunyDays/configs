#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lah --color=auto'
alias diff='diff --color=auto'
alias g='git'
unalias emacs

alias uncl='unclutter -idle 1 -root &'
alias telegram-cli='telegram-cli -k /etc/telegram-cli/server.pub -N'
export EDITOR='emacs'

PS1='\e[0;32m[\W] $\e[m '
PS2='>>> '
PS3='>> '
PS4='> '

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
