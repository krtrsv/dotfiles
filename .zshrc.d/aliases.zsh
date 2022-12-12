# generic
alias c="clear"
alias tb="nc termbin.com 9999"
alias code="code --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"

# ls
if [[ -x $(command -v exa) ]]; then
  alias ls="exa --git"
  alias ll="ls -la"
  alias l="ll"
  alias la="l"
else
  alias ls="ls --human-readable --color=auto --group-directories-first"
  alias ll="ls -lA"
  alias l="ll"
  alias la="l"
fi

# git
alias gs="git status"
alias ga="git add"
alias gc="git commit -S -m"
alias gp="git push"
alias gl="git log"
alias glo="git log --oneline"
