@echo off
chcp 65001 >nul
echo ========================================
echo   나이스 도우미 - GitHub Pages 배포
echo ========================================
echo.

cd /d "%~dp0"

:: Git 초기화 (이미 되어 있으면 skip)
if not exist ".git" (
    echo [1/5] Git 초기화 중...
    git init
    git branch -M main
) else (
    echo [1/5] Git 이미 초기화됨
)

:: Remote 설정
echo [2/5] Remote 설정 중...
git remote remove origin 2>nul
git remote add origin https://github.com/kyn1018-collab/nise.git

:: 파일 추가
echo [3/5] 파일 추가 중...
git add .

:: 커밋
echo [4/5] 커밋 중...
git commit -m "나이스 도우미 챗봇 업데이트 %date% %time%"

:: 푸시
echo [5/5] GitHub에 푸시 중...
git push -u origin main

echo.
echo ========================================
echo  배포 완료!
echo  사이트: https://kyn1018-collab.github.io/nise/
echo ========================================
pause
