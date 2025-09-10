#!/bin/bash

echo "Starting Flutter setup..."

# 1. 로컬 Flutter 설치 (git clone 방식)
echo "Installing Flutter locally..."
if [ ! -d "$HOME/development/flutter" ]; then
    mkdir -p $HOME/development
    cd $HOME/development
    git clone https://github.com/flutter/flutter.git -b stable
    echo "Flutter cloned to ~/development/flutter"
else
    echo "Flutter already exists at ~/development/flutter"
fi

# 2. PATH에 Flutter 추가 (zshrc에 추가)
echo "Adding Flutter to PATH..."
if ! grep -q "export PATH=\"\$HOME/development/flutter/bin:\$PATH\"" ~/.zshrc; then
    echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zshrc
    echo "Flutter PATH added to ~/.zshrc"
fi

# 3. zshrc 리로드
source ~/.zshrc

# 4. Flutter 설정 최적화
echo "Configuring Flutter settings..."
flutter config --no-analytics
flutter config --no-cli-animations
flutter config --enable-web
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
flutter config --enable-windows-desktop

# 5. Flutter doctor 실행하여 의존성 확인
echo "Running Flutter doctor..."
flutter doctor

# 6. FVM 설치 및 설정
echo "Setting up FVM..."
if command -v fvm &> /dev/null; then
    echo "FVM already installed"
else
    echo "Installing FVM..."
    dart pub global activate fvm
fi

# 7. FVM으로 stable 버전 설치 및 글로벌 설정
echo "Installing Flutter stable via FVM..."
fvm install stable
fvm global stable

# 8. FVM PATH 추가
if ! grep -q "export PATH=\"\$HOME/fvm/default/bin:\$PATH\"" ~/.zshrc; then
    echo 'export PATH="$HOME/fvm/default/bin:$PATH"' >> ~/.zshrc
    echo "FVM PATH added to ~/.zshrc"
fi

# 9. 최종 zshrc 리로드
source ~/.zshrc

# 10. Flutter precache (자주 사용되는 아티팩트 미리 다운로드)
echo "Pre-caching Flutter artifacts..."
flutter precache

# 11. Flutter 플러그인 의존성 설치
echo "Installing Flutter dependencies..."
flutter doctor --android-licenses

# 12. 설정 완료 확인
echo ""
echo "=== Flutter Setup Complete ==="
echo "Checking Flutter installation..."
flutter --version
echo ""
echo "Checking FVM setup..."
fvm --version
echo ""
echo "Final Flutter doctor check..."
flutter doctor

echo ""
echo "🎉 Flutter setup completed!"
echo "💡 Tips:"
echo "   - Use 'flutter doctor' to check for any remaining issues"
echo "   - Use 'fvm use stable' in project directories to use FVM"
echo "   - Restart your terminal or run 'source ~/.zshrc' to ensure PATH changes take effect"