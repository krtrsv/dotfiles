PATH=$PATH:$HOME/.local/bin

# Haskell
[ -f "/home/kira/.ghcup/env" ] && source "/home/kira/.ghcup/env"

# Rust
[ -f "/home/kira/.cargo/env" ] && source "/home/kira/.cargo/env"

# Config
if [[ -d ~/.zshrc.d/ ]]; then
  for rc in ~/.zshrc.d/* ; do
    source $rc
  done
fi

# Plugins
if [[ -d /usr/share/zsh/plugins ]]; then
  for plugin in /usr/share/zsh/plugins/* ; do
    source $plugin/*.plugin.zsh
  done
fi

# Other plugins
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]
then
   source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Set tty for gpg
export GPG_TTY=$(tty)

## History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

## History command configuration

# record timestamp of command in HISTFILE
setopt extended_history

# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_expire_dups_first

# ignore duplicated commands history list
setopt hist_ignore_dups

# ignore commands that start with space
setopt hist_ignore_space

# show command with history expansion to user before running it
setopt hist_verify

# share command history data
setopt share_history

setopt autocd
