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

echo "Install brew"
echo "Start ###########################################################"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "End #############################################################"

echo "Install apps by brew"
echo "Start ###########################################################"
brew bundle --file=./Brewfile
brew bundle --file=./Brewfile
echo "End #############################################################"

echo "Install Ruby"
echo "Start ###########################################################"
chmod 755 ./ruby/install.sh
./ruby/install.sh
echo "End #############################################################"

echo "Install zsh"
echo "Start ###########################################################"
chmod 755 ./zsh/install.sh
./zsh/install.sh
echo "End #############################################################"

echo "Install iTerms2"
echo "Start ###########################################################"
chmod 755 ./iterm2/install.sh
zsh ./iterm2/install.sh
echo "End #############################################################"

echo "Install Node"
echo "Start ###########################################################"
chmod 755 ./node/install.sh
zsh ./node/install.sh
echo "End #############################################################"

echo "Install VSCode"
echo "Start ###########################################################"
chmod 755 ./vscode/install.sh
zsh ./vscode/install.sh
echo "End #############################################################"

echo "Install Flutter"
echo "Start ###########################################################"
chmod 755 ./flutter/install.sh
zsh ./flutter/install.sh
echo "End #############################################################"

echo "Install Xcode"
echo "Start ###########################################################"
chmod 755 ./xcode/install.sh
zsh ./xcode/install.sh
echo "End #############################################################"

echo "Download KakaoTalk from official site"
curl -L -o ~/Downloads/KakaoTalk.dmg "https://download.kakao.com/mac/KakaoTalk.dmg"

echo "Download Alfred from official site"
curl -L -o ~/Downloads/Alfred.dmg "https://www.alfredapp.com/latest/Alfred_5.0.6.dmg"

echo "Open Keka download page"
open "https://www.keka.io/en/"

echo "Open Mac App Store for Fuwari"
open "macappstore://apps.apple.com/kr/app/fuwari/id1465714562?mt=12"

echo "Open Mac App Store for Shottr"
open "macappstore://apps.apple.com/kr/app/shottr/id1562955201?mt=12"

echo "Open Mac App Store for KakaoTalk"
open "macappstore://apps.apple.com/kr/app/kakaotalk/id869223134?mt=12"

echo "Please change wallpaper"
echo "Right click on the desktop -> Change Wallpaper... -> Select Black color"
echo "Please change keyboard shortcuts by yourself."
echo "Open System Settings -> Keyboard -> Keyboard Shortcuts... -> Input Sources -> Select the previous input source -> Change to Command + Space"
echo "Open System Settings -> Keyboard -> Keyboard Shortcuts... -> Input Sources -> Select Next source input menu -> Change to Command + Shift + Space"
echo "Open System Settings -> Keyboard -> Keyboard Shortcuts... -> Spotlight -> Show Spotlight search -> Change to Option + Space"
echo "Open System Settings -> Keyboard -> Keyboard Shortcuts... -> Spotlight -> Show Finder search window -> Change to Command + Option + Space"
echo "Optimize."
echo "Open System Settings -> Accessibility -> Enable 'Reduce motion' and 'Reduce transparency'"
echo "Open System Settings -> Spotlight -> Disable all without Applications"

sudo pmset -c disablesleep 0
