#!/bin/zsh
cd "$(dirname "$0")"
git pull

function doIt(){
    rsync --eclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}

if ["$1" == "--force" -o "$1" == "-f"]; then
    doIt
else
    read -p "This may overwrite exiting files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi

unset doIt
source ~/.zshrc

