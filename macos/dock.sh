#!/bin/bash

# Dock에서 최근 사용 앱 표시 비활성화
defaults write com.apple.dock show-recents -bool false

# Dock의 기존 앱들 모두 제거
defaults write com.apple.dock persistent-apps -array

# Dock 재시작으로 변경사항 적용
sleep 1
killall Dock

# 고정할 앱들 배열 (Figma, KakaoTalk, Slack, Chrome만)
apps=(
    "/Applications/Figma.app"
    "/Applications/KakaoTalk.app" 
    "/Applications/Slack.app"
    "/Applications/Google Chrome.app"
)

# 각 앱을 Dock에 추가
for app in "${apps[@]}"; do
    # 앱이 존재하는지 확인
    if [ -e "$app" ]; then
        defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
        echo "Added: $app"
    else
        echo "App not found: $app"
    fi
    sleep 1
done

# Dock 효과를 scale로 설정 (최소화 애니메이션)
defaults write com.apple.dock mineffect -string scale

# Dock 자동 숨김 비활성화
defaults write com.apple.dock autohide -bool false

# 최종 Dock 재시작
sleep 1
killall Dock

echo "Dock setup completed!"