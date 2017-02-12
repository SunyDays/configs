#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lah --color=auto'

alias telegram-cli='telegram-cli -k /etc/telegram-cli/server.pub -N'
alias emacs='emacsclient -c --socket-name /tmp/emacs1000/server'
export EDITOR='emacsclient -c --socket-name /tmp/emacs1000/server'

PS1='\e[0;32m[\W] \$\e[m '
PS2='> '
PS3='> '
PS4='+ '

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
