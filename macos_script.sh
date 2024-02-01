#!/bin/bash                                                                                                                                                    
brew install --cask alacritty
brew install fd
brew install fzf
brew install tldr
brew install parallel
brew install koekeishiya/formulae/skhd
skhd --start-service
brew install bat
brew install tree
brew install curlie

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Load syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# install for bacward fuzzy search
# $HOMEBREW_PREFIX/opt/fzf/install

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

