@echo off
chcp 65001 >nul
title Zombie Survival 3D - relay server
cd /d "%~dp0"

echo.
echo   ==================================================
echo      ZOMBIE SURVIVAL 3D  -  relay-сервер для коопу
echo   ==================================================
echo.

rem --- Перевіряємо, чи встановлено Node.js ---
where node >nul 2>nul
if errorlevel 1 (
  echo   [!] Node.js не встановлено.
  echo.
  echo   1^) Постав його з https://nodejs.org  ^(велика зелена кнопка LTS^)
  echo   2^) Перезавантаж комп'ютер
  echo   3^) Запусти цей файл ще раз ^(подвійний клік^)
  echo.
  echo   Зараз відкрию сайт для завантаження...
  timeout /t 2 >nul
  start "" https://nodejs.org
  echo.
  pause
  exit /b
)

rem --- Перший запуск: ставимо залежності (ws) ---
if not exist "node_modules" (
  echo   Перший запуск - встановлюю потрібне ^(це разова дія, ~10-30 сек^)...
  echo.
  call npm install
  if errorlevel 1 (
    echo.
    echo   [!] Не вдалося встановити. Перевір інтернет і запусти файл знову.
    echo.
    pause
    exit /b
  )
  echo.
)

echo   ---------------------------------------------------
echo    Запускаю сервер. НЕ ЗАКРИВАЙ це вікно під час гри!
echo    Щоб зупинити сервер - просто закрий це вікно.
echo   ---------------------------------------------------
echo.
call npm start

echo.
echo   Сервер зупинено.
pause
