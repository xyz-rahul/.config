#!/bin/zsh

export PATH="$PATH:$HOME/.config/scripts"

# TMUX session handling
if [ -z "$TMUX" ]; then
    tmux attach -t TMUX || tmux new -s TMUX
fi


# Command history settings
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

export FZF_CTRL_R_OPTS="
                      --preview 'echo {}' --preview-window up:3:hidden:wrap
                      --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
                      --header 'Press CTRL-Y to copy command into clipboard'"


# Editor and grep settings
export CLICOLOR=1
export EDITOR='nvim'
export GREP_OPTIONS='--color=always'
alias cat='bat -pp --color=always'
alias v='nvim'
alias db='nvim +DBUI'
alias curl='curlie'

# Directory navigation aliases
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias cd..="cd .." # Typo addressed


# warning: only include on mac
# Load syntax highlighting (for Mac)
# source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# bacward fuzzy search => run on install
# $HOMEBREW_PREFIX/opt/fzf/install


zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle Tarrasch/zsh-command-not-found
antigen bundle ael-code/zsh-colored-man-pages

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

echo "zsh config loaded"
