/usr/bin/keychain $HOME/.ssh/id_rsa
/usr/bin/keychain $HOME/.ssh/presslabs.key
source $HOME/.keychain/$HOSTNAME-sh

case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      color_prompt=yes
    else
      color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
     PS1='${debian_chroot:+($debian_chroot)}\n\[\033[0;33m\]\[\033[0;34m\]\u <\[\033[0;32m\]\h\[\033[0;34m\]> \[\033[0;36m\]\w\[\033[0;34m\]$(__git_ps1 " (%s)")\[\033[0m\]\n'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias p='python'

## apt specific
alias sa='sudo apt-get'
alias sai='sudo apt-get install'
alias sau='sudo apt-get update'
alias saug='sudo apt-get upgrade'
alias sar='sudo apt-get remove'
alias sap='sudo apt-get --purge autoremove'
alias ac='apt-cache'

## tools
alias http='python -m SimpleHTTPServer ${1}'

alias 'tf=tail -f'
alias 'q=exit'
alias 'h=history'
alias 'v=vim'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export EDITOR="vim"
set keymap vi-command
set editing-mode vi
set -o vi

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PS1='${debian_chroot:+($debian_chroot)}\n\[\033[0;33m\]\[\033[0;34m\]\u <\[\033[0;32m\]\h\[\033[0;34m\]> \[\033[0;36m\]\w\[\033[0;34m\]$(__git_ps1 " (%s)")\[\033[0m\]\n'

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
