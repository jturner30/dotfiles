# Shell
alias cls='clear; ls'
alias ll='ls -alGh'
alias ls='ls -Gh'
alias l='ll'
alias lsg='ls | grep'
alias less='less -r'
alias tf='tail -f'
alias reload!='. ~/.zshrc'
alias df='df -h'
alias ..='cd ..'
alias vim="nvim"
alias v='vim'
alias tm='tmux'
alias h='history | fzf | cut -c 8- | pbcopy'
alias cl='clear'
alias sc='$(history | cut -c 8- | fzf)'

# IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Lock the screen (when going AFK)
if [[ "$(uname)" == "Darwin" ]]; then
  alias afk="pmset sleepnow"
else
  alias afk="i3lock"
fi

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Decent map function
# ex: ls | map cat
alias map='xargs -n1'

# Find and edit
alias fe='vim $(fzf)'

# Select git branch
alias gsb='git checkout $(git branch | fzf)'
# Delete selected git branch
alias gsd!='git delete-branch $(git branch | grep -v "master$" | grep -v "stage$" | fzf)'
# Resolve merge conflicts in vim
alias grc='vim -p $(git diff --name-only --diff-filter=U) +"/HEAD"'

# If on mac, use macvim's rendering engine because terminal vim on mac normally
# suuuuuuuucks at rendering
# if [ $(uname) = 'Darwin' ]; then
#   alias vim='mvim -v'
# fi
