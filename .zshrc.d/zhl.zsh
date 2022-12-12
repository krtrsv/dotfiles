ZSH_HIGHLIGHT_HIGHLIGHTERS=(
  main
  brackets
  pattern
  regexp
  line
)

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$red"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=purple"

ZSH_HIGHLIGHT_STYLES[alias]="fg=blue"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=blue"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=blue"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=blue"
ZSH_HIGHLIGHT_STYLES[function]="fg=blue"
ZSH_HIGHLIGHT_STYLES[command]="fg=blue"

ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=grey"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=green" ###
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=blue"
ZSH_HIGHLIGHT_STYLES[path]="fg=green,underline"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=blue"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=yellow"

ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=orange"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]="fg=orange"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]="fg=orange"

ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]="fg=orange"

ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]="fg=orange"

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=grey"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=grey"

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=purple"

ZSH_HIGHLIGHT_STYLES[assign]="fg=orange"

ZSH_HIGHLIGHT_STYLES[redirection]="fg=orange"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=orange"


ZSH_HIGHLIGHT_STYLES[precommand]="fg=white,underline"
# ZSH_HIGHLIGHT_STYLES[default]="fg=red"

# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=yellow,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=red,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-4]="fg=purple,bold"

# ZSH_HIGHLIGHT_STYLES[cursor]="bg=red"
