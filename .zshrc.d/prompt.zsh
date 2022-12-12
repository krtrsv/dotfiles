autoload -Uz vcs_info
autoload add-zsh-hook
add-zsh-hook precmd vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true

zstyle ':vcs_info:git:*' stagedstr "[+]"
zstyle ':vcs_info:git:*' unstagedstr "[?]"
zstyle ':vcs_info:git:*' formats  " %f(%F{magenta}%b%F{green}%c%F{yellow}%u%f)"

PROMPT="%F{green}%m%f:%F{red}[%F{blue}%n%F{red}]%f:%F{cyan}%~\${vcs_info_msg_0_}%F{yellow}$%f "
