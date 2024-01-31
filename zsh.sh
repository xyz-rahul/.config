#!/bin/zsh
# Install zsh-autosuggestions
if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

bindkey '^ ' autosuggest-accept

# Configure command history settings
HISTSIZE=5000                 # Set maximum number of lines in history
HISTFILE=~/.zsh_history       # Define the location of the history file
SAVEHIST=5000                 # Save 5000 lines of history to the file
HISTDUP=erase                 # Remove duplicates in history
setopt appendhistory          # Append new history lines to the history file
setopt sharehistory           # Share history among all sessions
setopt incappendhistory       # Immediately append new lines to the history file
setopt hist_ignore_all_dups   # Ignore all duplicated commands in history
setopt hist_save_no_dups      # Save only the most recent instance of a duplicated command
setopt hist_ignore_dups       # Ignore duplicates when searching history
setopt hist_find_no_dups      # Do not display duplicates when searching history

# Enable case-insensitive completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


#Show git branch in PROMPT
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%B%F{yellow}git:(%F{red} %b %f%F{yellow})%f'
setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_

PROMPT='%B%F{green}%n%f%b %B%F{blue}%1~%f%b $ '

# FZF
export FZF_DEFAULT_OPTS="--preview 'bat -n --color=always {}' \
                        --multi \
                        --bind 'ctrl-v:execute(nvim {+})+abort,ctrl-p:toggle-preview,ctrl-y:execute-silent(echo {} | pbcopy)'"

export FZF_DEFAULT_COMMAND='fd --type f  --hidden --follow --exclude .git'

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
  
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-p:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

bindkey -s "^f" 'fzf^M'
alias F="fzf"

export EDITOR='nvim'
export GREP_OPTIONS='--color=always'

alias cat='bat -pp --color=always'
alias v='nvim'


# Always use color output for `ls`
alias ls="command ls -G"

# List only directories
alias lsd="ls -lF -G | grep --color=never '^d'"

# Easier directory navigation.
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias cd..="cd .." # Typo addressed.
alias C="clear"


echo "zsh config loaded"
