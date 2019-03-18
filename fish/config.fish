# Fish shell custom config

set -gx BROWSER "elinks -remote"
set -gx CLICOLOR 1
set -gx TERM xterm-256color
set -gx PAGER less
set -gx LESS -iMSx4RFX

. $HOME/.config/fish/prompt.fish

if test -f $HOME/.config/fish/alias.fish
  . $HOME/.config/fish/alias.fish
end

if test -f $HOME/.config/fish/proxy.fish
  . $HOME/.config/fish/proxy.fish
end

if test -d $HOME/perl5
  set -gx PATH $PATH $HOME/perl5/bin
  set -gx PERL5LIB $HOME/perl5/lib/perl5:$HOME/perl5/lib/perl5/site_perl
end

if test -d $HOME/.local
  set -gx PATH $PATH $HOME/.local/bin
end

