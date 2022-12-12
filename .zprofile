# Neovim as default text editor
export VISUAL=nvim
export EDITOR=nvim

# Dont create ~/.lesshst
export LESSHISTFILE=/dev/null

# Force firefox to use wayland
export MOZ_ENABLE_WAYLAND=1

# Force Qt to use wayland
export QT_QPA_PLATFORM=wayland

# Tell fzf to use `fd` instead of `find`
export FZF_DEFAULT_COMMAND='fd -tf'
