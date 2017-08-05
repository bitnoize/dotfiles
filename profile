# dotfiles/profile

#umask 022

if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

if [ -d "$HOME/.local" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/perl5" ]; then
  PATH="$HOME/perl5/bin:$PATH"

  PERL5LIB="$HOME/perl5/lib/perl5:$HOME/perl5/lib/perl5/site_perl"
  export PERL5LIB
fi

export PAGER="less"
export LESS="-iMSx4RFX"

