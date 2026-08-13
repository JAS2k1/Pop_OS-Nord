# ---------- history ----------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS SHARE_HISTORY EXTENDED_HISTORY

# ---------- behaviour ----------
setopt AUTO_CD EXTENDED_GLOB INTERACTIVE_COMMENTS
unsetopt BEEP

# ---------- completion ----------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ---------- keys ----------
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---------- git branch in prompt ----------
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=(precmd_vcs_info)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{#EBCB8B}%b%f'
setopt PROMPT_SUBST

PROMPT='%F{#81A1C1}%~%f${vcs_info_msg_0_} %F{#A3BE8C}→%f '

# ---------- aliases ----------
alias ls='ls --color=auto'
alias ll='ls -alh'
alias ff='fastfetch'

# ---------- plugins (highlighting must be last) ----------
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4C566A'
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias weather='curl -s wttr.in/Stockholm'
alias weather='curl -s wttr.in/Stockholm'
