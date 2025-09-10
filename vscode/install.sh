#!/bin/bash

# VSCode 격리 속성 제거
sudo xattr -dr com.apple.quarantine /Applications/Visual\ Studio\ Code.app

# 필수 VSCode 확장 프로그램 설치
echo "Installing essential VSCode extensions..."

# AI/Copilot
code --install-extension GitHub.copilot
code --install-extension GitHub.copilot-chat

# Flutter/Dart 개발
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter

# Cline (AI Assistant)
code --install-extension saoudrizwan.claude-dev

# IntelliJ IDEA Keybindings
code --install-extension k--kato.intellij-idea-keybindings

# 기본 개발 도구
code --install-extension esbenp.prettier-vscode

# Git
code --install-extension mhutchie.git-graph
code --install-extension GitHub.vscode-pull-request-github
code --install-extension eamodio.gitlens

# 유용한 UI/편의성 확장
code --install-extension vscode-icons-team.vscode-icons
code --install-extension oderwat.indent-rainbow
code --install-extension usernamehw.errorlens

echo "Extensions installed successfully!"

# VSCode 설정 파일 복사 (설정 파일이 존재하는 경우)
if [ -f "./vscode/settings.json" ]; then
    cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    echo "settings.json copied"
fi

if [ -f "./vscode/keybindings.json" ]; then
    cp ./vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    echo "keybindings.json copied"
fi

echo "VSCode setup completed!"