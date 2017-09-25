# dotfiles/bashrc

[ -z "$PS1" ] && return

# update the LINES and COLUMNS variables if necessary
shopt -s checkwinsize

# history size
HISTSIZE=5000

# don't put duplicate lines in the history
HISTCONTROL="ignoredups"
HISTCONTROL="ignorespace"
HISTCONTROL="erasedups"

PROMPT_COMMAND="history -a; history -n"

# append to the history file
shopt -s histappend

# make less more friendly for non-text input files
[ -x "/usr/bin/lesspipe" ] && eval "$( SHELL=/bin/sh lesspipe )"

# set variable identifying the chroot you work in 
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$( cat /etc/debian_chroot )
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # set a fancy prompt 
  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
else
  # set a non-colored prompt
  PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
fi

# aliases definitions
if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

# completion definitions
if [ -f "/etc/bash_completion" ] && ! shopt -oq posix; then
  . "/etc/bash_completion"
fi

# proxies definitions
if [ -f "$HOME/.bash_proxy" ]; then
  . "$HOME/.bash_proxy"
fi

