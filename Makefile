.PHONY: all homebrew brewfile ruby zsh iterm2 vscode flutter xcode macos dock touchpad

all: homebrew brewfile ruby zsh iterm2 vscode flutter xcode

homebrew:
	if ! command -v brew &> /dev/null; then \
		echo "Install brew"; \
		echo "Start ###########################################################"; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"; \
		echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile; \
		eval "$$(/opt/homebrew/bin/brew shellenv)"; \
		echo "End #############################################################"; \
	else \
		echo "Homebrew already installed. Skipping..."; \
	fi

brewfile:
	if [ -f "./Brewfile" ]; then \
		echo "Install apps by brew"; \
		echo "Start ###########################################################"; \
		brew bundle --file=./Brewfile; \
		echo "End #############################################################"; \
	else \
		echo "No Brewfile found. Skipping Homebrew bundle install."; \
	fi

ruby:
	if ! command -v ruby &> /dev/null; then \
		echo "Install Ruby"; \
		echo "Start ###########################################################"; \
		chmod 755 ./ruby/install.sh; \
		./ruby/install.sh; \
		echo "End #############################################################"; \
	else \
		echo "Ruby already installed. Skipping..."; \
	fi

zsh:
	if [ -d "~/.oh-my-zsh" ] || [ "$$SHELL" = "/bin/zsh" ]; then \
		echo "Zsh already installed/configured. Skipping..."; \
	else \
		echo "Install zsh"; \
		echo "Start ###########################################################"; \
		chmod 755 ./zsh/install.sh; \
		./zsh/install.sh; \
		echo "End #############################################################"; \
	fi

iterm2:
	if [ -d "/Applications/iTerm.app" ]; then \
		echo "iTerm2 already installed. Skipping..."; \
	else \
		echo "Install iTerm2"; \
		echo "Start ###########################################################"; \
		chmod 755 ./iterm2/install.sh; \
		zsh ./iterm2/install.sh; \
		echo "End #############################################################"; \
	fi

vscode:
	if [ -d "/Applications/Visual Studio Code.app" ]; then \
		echo "VSCode already installed. Skipping..."; \
	else \
		echo "Install VSCode"; \
		echo "Start ###########################################################"; \
		chmod 755 ./vscode/install.sh; \
		zsh ./vscode/install.sh; \
		echo "End #############################################################"; \
	fi

flutter:
	if command -v flutter &> /dev/null; then \
		echo "Flutter already installed. Skipping..."; \
	else \
		echo "Install Flutter"; \
		echo "Start ###########################################################"; \
		chmod 755 ./flutter/install.sh; \
		zsh ./flutter/install.sh; \
		echo "End #############################################################"; \
	fi

xcode:
	if [ -d "/Applications/Xcode.app" ]; then \
		echo "Xcode already installed. Skipping..."; \
	else \
		echo "Install Xcode"; \
		echo "Start ###########################################################"; \
		chmod 755 ./xcode/install.sh; \
		zsh ./xcode/install.sh; \
		echo "End #############################################################"; \
	fi

macos: dock touchpad

dock:
	chmod +x ./macos/dock.sh; \
	./macos/dock.sh

touchpad:
	chmod +x ./macos/touchpad.sh; \
	./macos/touchpad.sh
