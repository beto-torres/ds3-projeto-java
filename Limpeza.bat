@echo off
echo ===================================================
echo    Limpeza de Ambiente - Laboratorio ETE
echo ===================================================
echo.

echo [1/6] Fechando Aplicativos (Navegadores, VS Code e WhatsApp)...
taskkill /F /IM chrome.exe /T >nul 2>&1
taskkill /F /IM msedge.exe /T >nul 2>&1
taskkill /F /IM firefox.exe /T >nul 2>&1
taskkill /F /IM code.exe /T >nul 2>&1
taskkill /F /IM WhatsApp.exe /T >nul 2>&1

echo [2/6] Limpando configuracoes globais do Git...
git config --global --unset user.name >nul 2>&1
git config --global --unset user.email >nul 2>&1

echo [3/6] Removendo credenciais do Windows (Git e VS Code)...
cmdkey /delete:"git:https://github.com" >nul 2>&1
cmdkey /delete:"git:https://gitlab.com" >nul 2>&1
cmdkey /delete:"git:https://bitbucket.org" >nul 2>&1
cmdkey /delete:"vscode-microsoft.login" >nul 2>&1
cmdkey /delete:"vscode-github.login" >nul 2>&1

echo [4/6] Limpando tokens de ferramentas CLI (Expo, Vercel, NPM)...
RD /S /Q "%USERPROFILE%\.expo" >nul 2>&1
RD /S /Q "%APPDATA%\vercel" >nul 2>&1
RD /S /Q "%USERPROFILE%\.vercel" >nul 2>&1
del /F /Q "%USERPROFILE%\.npmrc" >nul 2>&1

echo [5/6] Limpando a pasta de projetos locais (C:\dev)...
RD /S /Q "C:\dev" >nul 2>&1
mkdir "C:\dev" >nul 2>&1

echo [6/6] Removendo perfis e sessoes (Navegadores, VS Code e WhatsApp)...
:: Chrome
RD /S /Q "%LOCALAPPDATA%\Google\Chrome\User Data" >nul 2>&1
:: Edge
RD /S /Q "%LOCALAPPDATA%\Microsoft\Edge\User Data" >nul 2>&1
:: Firefox
RD /S /Q "%APPDATA%\Mozilla\Firefox\Profiles" >nul 2>&1
:: VS Code
RD /S /Q "%APPDATA%\Code\User\globalStorage" >nul 2>&1
RD /S /Q "%APPDATA%\Code\User\workspaceStorage" >nul 2>&1
:: WhatsApp Desktop
RD /S /Q "%LOCALAPPDATA%\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalCache" >nul 2>&1
RD /S /Q "%LOCALAPPDATA%\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalState" >nul 2>&1

echo.
echo ===================================================
echo Limpeza concluida com sucesso! O PC esta pronto.
echo O terminal sera fechado em 3 segundos...
echo ===================================================
timeout /t 3 >nul
