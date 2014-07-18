#!/bin/bash

git pull
function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude ".gitmodules" --exclude "bootstrap.sh" --exclude "README.md" --exclude ".osx" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt

source ~/.zshrc
ln -s ~/.vimrc ~/.gvimrc