#!/usr/bin/env bash

CHT_SH_LIST_CACHE_DIR=$HOME/'.cache/'
CHT_SH_LIST_CACHE=$HOME/'.cache/cht_sh_cached_list'

#Cache the list on first run
if [ ! -f "$CHT_SH_LIST_CACHE" ]; then
    if [ ! -d "$CHT_SH_LIST_CACHE_DIR" ]; then
        mkdir $CHT_SH_LIST_CACHE_DIR
    fi
    echo "First time run. Downloading cht.sh cht.sh/:list to cache..."
    curl cht.sh/:list > $CHT_SH_LIST_CACHE
fi


#Select a cht.sh cheat from the list
selected=`cat $CHT_SH_LIST_CACHE | fzf --reverse --height 75% --border -m --ansi --nth 2..,.. --prompt='CHEAT.SH> ' --preview='curl -s cht.sh/{}' --preview-window=right:80%`
if [[ -z $selected ]]; then
    exit 0
fi

# Ask the user what they would like to query (with live preview, also displays preview for topics not given by cheat.sh/$selected/:list)
query=`curl -s cht.sh/$selected/:list | fzf --print-query --reverse --height 75% --border -m --ansi --nth 2..,.. --prompt='CHEAT.SH/'$(echo $selected | tr a-z A-Z)'> ' \
    --preview='curl -s cht.sh/'$selected'/{1} && curl -s cht.sh/'$selected'/{q}' --preview-window=right:80%`
# BUG: Fix below above logic so it displays preview when there is an available match to query, otherwise attempts to curl unmatched query


#Retreive the cheatsheet from cht.sh
if grep -qs "$selected" $CHT_SH_LIST_CACHE; then
    query=`echo $query | tr ' ' '+' | sed 's/.*+//'`
    if [[ -z $query ]]; then
        echo "curl cht.sh/$selected" & curl cht.sh/$selected
    else
        echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query
    fi
else
    #If its not in the cache, query cht.sh anyways and hope for the best
    curl -s cht.sh/$selected~$query
fi
