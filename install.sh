#!/bin/sh -e

# Enable systemd for specific user
# sudo loginctl enable-linger mitya

# Do not run this script under root
[ "$(id -u)" -eq 0 ] && exit 10

DOTS="$HOME/dotfiles"
[ -d "$DOTS" ] && cd "$DOTS" || exit 20

mkdir -p "$HOME/.config" "$HOME/.local" "$HOME/.config/systemd/user"

ln -T -sf "$DOTS/bin"     "$HOME/.local/bin"
ln -T -sf "$DOTS/inputrc" "$HOME/.inputrc"

conf_git() {
  printf "* git         : "

  ln -T -sf "$DOTS/git/config"  "$HOME/.gitconfig"

  printf "OK\n"
}

conf_bash() {
  printf "* bash        : "

  ln -T -sf "$DOTS/bash/profile"      "$HOME/.profile"
  ln -T -sf "$DOTS/bash/bashrc"       "$HOME/.bashrc"
  ln -T -sf "$DOTS/bash/bash_logout"  "$HOME/.bash_logout"

  [ ! -f "$HOME/.bash_aliases" ] && \
    cp "$DOTS/bash/bash_aliases.dist" "$HOME/.bash_aliases"

  [ ! -f "$HOME/.bash_proxies" ] && \
    cp "$DOTS/bash/bash_proxies.dist" "$HOME/.bash_proxies"

  printf "OK\n"
}

conf_fish() {
  printf "* fish        : "

  mkdir -p "$HOME/.config/fish"

  ln -T -sf "$DOTS/fish/config.fish"  "$HOME/.config/fish/config.fish"

  [ ! -f "$HOME/.config/fish/aliases.fish" ] && \
    cp "$DOTS/fish/aliases.fish.dist" "$HOME/.config/fish/aliases.fish"

  [ ! -f "$HOME/.config/fish/proxies.fish" ] && \
    cp "$DOTS/fish/proxies.fish.dist" "$HOME/.config/fish/proxies.fish"

  printf "OK\n"
}

conf_ssh() {
  printf "* ssh         : "

  mkdir -p "$HOME/.ssh"

  [ ! -f "$HOME/.ssh/config" ] && \
    cp "$DOTS/ssh/config.dist" "$HOME/.ssh/config"

  printf "OK\n"
}

conf_tmux() {
  printf "* tmux        : "

  mkdir -p "$HOME/.tmux"

  ln -T -sf "$DOTS/tmux/tmux.conf" "$HOME/.tmux.conf"
  #tmux source-file "$HOME/.tmux.conf" > /dev/null

  printf "OK\n"
}

conf_nvim() {
  printf "* nvim        : "

  mkdir -p "$HOME/.config/nvim" \
    "$HOME/.config/nvim/autoload" \
    "$HOME/.config/nvim/plugged"

  ln -T -sf "$DOTS/nvim/init.vim" "$HOME/.config/nvim/init.vim"
  ln -T -sf "$DOTS/nvim/plug.vim" "$HOME/.config/nvim/autoload/plug.vim"

  printf "OK\n"
}

conf_psql() {
  printf "* psql        : "

  ln -T -sf "$DOTS/psql/psqlrc" "$HOME/.psqlrc"

  printf "OK\n"
}

conf_mcabber() {
  printf "* mcabber     : "

  mkdir -p "$HOME/.mcabber" \
    "$HOME/.mcabber/logs" \
    "$HOME/.mcabber/otr"

  ln -T -sf "$DOTS/mcabber/mcabberrc" "$HOME/.mcabber/mcabberrc"
  ln -T -sf "$DOTS/mcabber/notify-send.sh" "$HOME/.mcabber/notify-send.sh"

  cp "$DOTS/mcabber/mcabberrc.example" "$HOME/.mcabber/mcabberrc.example"

  printf "OK\n"
}

conf_proxychains() {
  printf "* proxychains : "

  mkdir -p "$HOME/.proxychains"

  [ ! -f "$HOME/.proxychains/proxychains.conf" ] && \
    cp "$DOTS/proxychains/proxychains.conf.dist" \
      "$HOME/.proxychains/proxychains.conf"

  printf "OK\n"
}

conf_taskwarrior() {
  printf "* taskwarrior : "

  mkdir -p "$HOME/.task"

  ln -T -sf "$DOTS/taskwarrior/taskrc" "$HOME/.taskrc"

  printf "OK\n"
}

conf_timewarrior() {
  printf "* timewarrior : "

  mkdir -p "$HOME/.timew"

  ln -T -sf "$DOTS/timewarrior/timewrc" "$HOME/.timewrc"

  printf "OK\n"
}

conf_remind() {
  printf "* remind      : "

  mkdir -p "$HOME/.reminders"

  printf "OK\n"
}

conf_xorg() {
  printf "* xorg        : "

  ln -T -sf "$DOTS/xorg/Xresources" "$HOME/.Xresources"
  ln -T -sf "$DOTS/xorg/Xsession"   "$HOME/.Xsession"
  ln -T -sf "$DOTS/xorg/fonts.conf" "$HOME/.fonts.conf"

  printf "OK\n"
}

conf_i3wm() {
  printf "* i3wm        : "

  mkdir -p "$HOME/.i3"

  ln -T -sf "$DOTS/i3/config"           "$HOME/.i3/config"
  ln -T -sf "$DOTS/i3/external.conkyrc" "$HOME/.i3/external.conkyrc"
  ln -T -sf "$DOTS/i3/system.conkyrc"   "$HOME/.i3/system.conkyrc"

  printf "OK\n"
}

conf_dunst() {
  printf "* dunst       : "

  mkdir -p "$HOME/.config/dunst"

  ln -T -sf "$DOTS/dunst/dunstrc" "$HOME/.config/dunst/dunstrc"

  printf "OK\n"
}

conf_kitty() {
  printf "* kitty       : "

  mkdir -p "$HOME/.config/kitty"

  ln -T -sf "$DOTS/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

  printf "OK\n"
}

conf_newsbeuter() {
  printf "* newsbeuter  : "

  mkdir -p "$HOME/.newsbeuter"

  [ ! -f "$HOME/.newsbeuter/config" ] && \
    cp "$DOTS/newsbeuter/config.dist" "$HOME/.newsbeuter/config"

  [ ! -f "$HOME/.newsbeuter/urls" ] && \
    cp "$DOTS/newsbeuter/urls.dist" "$HOME/.newsbeuter/urls"

  printf "OK\n"
}

conf_rlang() {
  printf "* rlang       : "

  ln -T -sf "$DOTS/rlang/Rprofile" "$HOME/.Rprofile"

  printf "OK\n"
}

[ -x "$( which git )"         ] && conf_git || exit 30
[ -x "$( which bash )"        ] && conf_bash
[ -x "$( which fish )"        ] && conf_fish
[ -x "$( which ssh )"         ] && conf_ssh
[ -x "$( which tmux )"        ] && conf_tmux
[ -x "$( which nvim )"        ] && conf_nvim
[ -x "$( which psql )"        ] && conf_psql
[ -x "$( which mcabber )"     ] && conf_mcabber
[ -x "$( which proxychains )" ] && conf_proxychains
[ -x "$( which task )"        ] && conf_taskwarrior
#[ -x "$( which timew )"       ] && conf_timewarrior
[ -x "$( which remind )"      ] && conf_remind
[ -x "$( which Xorg )"        ] && conf_xorg
[ -x "$( which i3 )"          ] && conf_i3wm
[ -x "$( which dunst )"       ] && conf_dunst
[ -x "$( which kitty )"       ] && conf_kitty
[ -x "$( which newsbeuter )"  ] && conf_newsbeuter
[ -x "$( which R )"           ] && conf_rlang

exit 0
