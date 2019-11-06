# dotfiles/fish/config.fish

set -gx LANG "ru_RU.UTF8"
set -gx TZ "Europe/Moscow"
set -gx BROWSER "elinks -remote"
set -gx CLICOLOR 1
set -gx TERM xterm-256color
set -gx PAGER less
set -gx LESS -iMSx4RFX

if test -f $OMF_CONFIG/aliases.fish
  . $OMF_CONFIG/aliases.fish
end

if test -f $OMF_CONFIG/proxies.fish
  . $OMF_CONFIG/proxies.fish
end

if test -d $HOME/.local
  set -gx PATH $PATH $HOME/.local/bin
end

if test -d $HOME/perl5
  set -gx PATH $PATH $HOME/perl5/bin
  set -gx PERL5LIB $HOME/perl5/lib/perl5:$HOME/perl5/lib/perl5/site_perl
end

