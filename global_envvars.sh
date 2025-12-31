# Default apps
export EDITOR=nvim
export BROWSER=zen-browser

# Home vars
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_BIN_HOME=$HOME/.local/bin

# Unclutter home
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export WAKATIME_HOME=$XDG_CONFIG_HOME/wakatime
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GOPATH=$XDG_DATA_HOME/go
export HISTFILE=$XDG_STATE_HOME/bash/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export DOT_SAGE="$XDG_CONFIG_HOME/sage"

# Settings
## DevkitPro
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

## man pager
export MANPAGER="bat -plman"

# Added by Toolbox App
export PATH="$PATH:$XDG_DATA_HOME/JetBrains/Toolbox/scripts"
export PATH="$PATH:$HOME/.local/bin"

# GHCup
export PATH="$PATH:$HOME/.cabal/bin"
export GHCUP_USE_XDG_DIRS=1

# LaTeX
export PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2025/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2025/texmf-dist/doc/info:$INFOPATH
