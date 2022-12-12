# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/key-bindings.zsh
# https://wiki.archlinux.org/title/zsh#Key_bindings
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Use emacs key bindings
bindkey -e

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly

# [Backspace] - delete backward
if [[ -n "${key[Backspace]}" ]]; then
  bindkey -- "${key[Backspace]}"  backward-delete-char
fi

# [Delete] - delete forward
if [[ -n "${key[Delete]}"    ]]; then
  bindkey -- "${key[Delete]}"     delete-char
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${key[Shift-Tab]}" ]]; then
  bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${key[Up]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey -- "${key[Up]}"         up-line-or-beginning-search
fi

# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${key[Down]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey -- "${key[Down]}"       down-line-or-beginning-search
fi

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word

# [Ctrl-r] - Search backward incrementally for a specified string.
bindkey '^r' history-incremental-search-backward
# [Space] - don't do history expansion
bindkey ' ' magic-space

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
