#!/bin/bash

set -e

# Trap errors
error() { [ $1 -ne 0 ] && echo "Error: $1"; }
trap 'error $?' EXIT

# Do not run this script under root
[ "$EUID" -eq 0 ] && exit 1

DOTS="$HOME/dotfiles" && cd $DOTS

mkdir -p "$HOME/.config" "$HOME/.local"
ln -T -sf "$DOTS/bin" "$HOME/.local/bin"

conf_git() {
  echo -ne "* git         : "

  ln -T -sf "$DOTS/gitconfig" "$HOME/.gitconfig"
  git submodule update --init --recursive --quiet

  echo "OK"
}

conf_bash() {
  echo -ne "* bash        : "

  ln -T -sf "$DOTS/profile"       "$HOME/.profile"
  ln -T -sf "$DOTS/bashrc"        "$HOME/.bashrc"
  ln -T -sf "$DOTS/bash_logout"   "$HOME/.bash_logout"
  ln -T -sf "$DOTS/bash_aliases"  "$HOME/.bash_aliases"
  ln -T -sf "$DOTS/bash_proxy"    "$HOME/.bash_proxy"
  ln -T -sf "$DOTS/bash_cht.sh"   "$HOME/.bash_cht.sh"

  echo "OK"
}

conf_fish() {
  echo -ne "* fish        : "

  [ -d "$HOME/.config/fish" ] || mkdir -p "$HOME/.config/fish"

  ln -T -sf "$DOTS/fish/config.fish"  "$HOME/.config/fish/config.fish"
  ln -T -sf "$DOTS/fish/prompt.fish"      "$HOME/.config/fish/prompt.fish"
  ln -T -sf "$DOTS/fish/alias.fish.dist"  "$HOME/.config/fish/alias.fish.dist"
  ln -T -sf "$DOTS/fish/proxy.fish.dist"  "$HOME/.config/fish/proxy.fish.dist"
  ln -T -sf "$DOTS/fish/aliases.fish.dist"  "$HOME/.config/fish/aliases.fish.dist"

  echo "OK"
}

conf_ssh() {
  echo -ne "* ssh         : "

  mkdir -p "$HOME/.ssh"

  echo "OK"
}

conf_tmux() {
  echo -ne "* tmux        : "

  ln -T -sf "$DOTS/tmux.conf" "$HOME/.tmux.conf"
  ln -T -sf "$DOTS/tmux" "$HOME/.tmux"
  #tmux source-file "~/.tmux.conf" > /dev/null

  echo "OK"
}

conf_vim() {
  echo -ne "* vim         : "

  ln -T -sf "$DOTS/vimrc" "$HOME/.vimrc"
  ln -T -sf "$DOTS/vim" "$HOME/.vim"
  vim +PluginInstall +qall

  echo "OK"
}

conf_psql() {
  echo -ne "* psql        : "

  ln -T -sf "$DOTS/psqlrc" "$HOME/.psqlrc"

  echo "OK"
}

conf_mcabber() {
  echo -ne "* mcabber     : "

  #ln -T -sf "$DOTS/mcabber" "$HOME/.mcabber"

  echo "OK"
}

conf_proxychains() {
  echo -ne "* proxychains : "

  mkdir -p "$HOME/.proxychains"

  ln -T -sf "$DOTS/proxychains/proxychains.conf.dist" \
    "$HOME/.proxychains/proxychains.conf.dist"

  echo "OK"
}

conf_taskwarrior() {
  echo -ne "* taskwarrior : "

  ln -T -sf "$DOTS/taskrc" "$HOME/.taskrc"

  echo "OK"
}

conf_xorg() {
  echo -ne "* xorg        : "

  ln -T -sf "$DOTS/Xresources" "$HOME/.Xresources"
  ln -T -sf "$DOTS/Xsession" "$HOME/.Xsession"
  ln -T -sf "$DOTS/fonts.conf" "$HOME/.fonts.conf"

  echo "OK"
}

conf_i3wm() {
  echo -ne "* i3wm        : "

  ln -T -sf "$DOTS/i3" "$HOME/.i3"

  echo "OK"
}

conf_dunst() {
  echo -ne "* dunst       : "

  ln -T -sf "$DOTS/dunst" "$HOME/.config/dunst"

  echo "OK"
}

conf_newsbeuter() {
  echo -ne "* newsbeuter  : "

  ln -T -sf "$DOTS/newsbeuter" "$HOME/.newsbeuter"

  echo "OK"
}

[ -x "$( which git )"         ] && conf_git || exit 10
[ -x "$( which bash )"        ] && conf_bash
[ -x "$( which fish )"        ] && conf_fish
[ -x "$( which ssh )"         ] && conf_ssh
[ -x "$( which tmux )"        ] && conf_tmux
[ -x "$( which vim )"         ] && conf_vim
[ -x "$( which psql )"        ] && conf_psql
[ -x "$( which mcabber )"     ] && conf_mcabber
[ -x "$( which proxychains )" ] && conf_proxychains
[ -x "$( which task )"        ] && conf_taskwarrior
[ -x "$( which Xorg )"        ] && conf_xorg
[ -x "$( which i3 )"          ] && conf_i3wm
[ -x "$( which dunst )"       ] && conf_dunst
[ -x "$( which newsbeuter )"  ] && conf_newsbeuter

exit 0
