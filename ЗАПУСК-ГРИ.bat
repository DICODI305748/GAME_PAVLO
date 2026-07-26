@echo off
chcp 65001 >nul
title Zombie Survival 3D - локальний сервер
cd /d "%~dp0"

echo.
echo   ==================================================
echo      ZOMBIE SURVIVAL 3D  -  запуск гри
echo   ==================================================
echo.
echo   Відкриваю браузер за 2 секунди...

rem відкрити браузер трохи згодом, поки сервер стартує
start "" cmd /c "timeout /t 2 >nul & start http://localhost:8000"

rem Python вміє віддавати сервер однією командою — пробуємо його першим
where py >nul 2>nul && ( py -m http.server 8000 & goto :fim )
where python >nul 2>nul && ( python -m http.server 8000 & goto :fim )

rem інакше — через Node.js (мій маленький сервер, без встановлення)
where node >nul 2>nul && ( node server-static.js & goto :fim )

echo.
echo   [!] Не знайдено ні Python, ні Node.js.
echo       Постав Node.js з https://nodejs.org (кнопка LTS), перезавантаж
echo       комп'ютер і запусти цей файл ще раз.
echo.
start "" https://nodejs.org
pause
exit /b

:fim
echo.
echo   Сервер зупинено.
pause
