#!/bin/bash

while true; do
    read -p "Do you login App store? (y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Please login App store first."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo pmset -c disablesleep 1

# ---------- Homebrew ----------
if ! command -v brew &> /dev/null; then
    echo "Install brew"
    echo "Start ###########################################################"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "End #############################################################"
else
    echo "Homebrew already installed. Skipping..."
fi

# ---------- Brewfile ----------
if [ -f "./Brewfile" ]; then
    echo "Install apps by brew"
    echo "Start ###########################################################"
    brew bundle --file=./Brewfile
    echo "End #############################################################"
else
    echo "No Brewfile found. Skipping Homebrew bundle install."
fi

# ---------- Ruby ----------
if ! command -v ruby &> /dev/null; then
    echo "Install Ruby"
    echo "Start ###########################################################"
    chmod 755 ./ruby/install.sh
    ./ruby/install.sh
    echo "End #############################################################"
else
    echo "Ruby already installed. Skipping..."
fi

# ---------- Zsh ----------
if [ -d "~/.oh-my-zsh" ] || [ "$SHELL" = "/bin/zsh" ]; then
    echo "Zsh already installed/configured. Skipping..."
else
    echo "Install zsh"
    echo "Start ###########################################################"
    chmod 755 ./zsh/install.sh
    ./zsh/install.sh
    echo "End #############################################################"
fi

# ---------- iTerm2 ----------
if [ -d "/Applications/iTerm.app" ]; then
    echo "iTerm2 already installed. Skipping..."
else
    echo "Install iTerm2"
    echo "Start ###########################################################"
    chmod 755 ./iterm2/install.sh
    zsh ./iterm2/install.sh
    echo "End #############################################################"
fi

# ---------- Node ----------
if command -v node &> /dev/null; then
    echo "Node already installed. Skipping..."
else
    echo "Install Node"
    echo "Start ###########################################################"
    chmod 755 ./node/install.sh
    zsh ./node/install.sh
    echo "End #############################################################"
fi

# ---------- VSCode ----------
if [ -d "/Applications/Visual Studio Code.app" ]; then
    echo "VSCode already installed. Skipping..."
else
    echo "Install VSCode"
    echo "Start ###########################################################"
    chmod 755 ./vscode/install.sh
    zsh ./vscode/install.sh
    echo "End #############################################################"
fi

# ---------- Flutter ----------
if command -v flutter &> /dev/null; then
    echo "Flutter already installed. Skipping..."
else
    echo "Install Flutter"
    echo "Start ###########################################################"
    chmod 755 ./flutter/install.sh
    zsh ./flutter/install.sh
    echo "End #############################################################"
fi

# ---------- Xcode ----------
if [ -d "/Applications/Xcode.app" ]; then
    echo "Xcode already installed. Skipping..."
else
    echo "Install Xcode"
    echo "Start ###########################################################"
    chmod 755 ./xcode/install.sh
    zsh ./xcode/install.sh
    echo "End #############################################################"
fi

sudo pmset -c disablesleep 0
