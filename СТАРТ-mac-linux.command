#!/usr/bin/env bash
# Zombie Survival 3D — relay server launcher (Mac / Linux)
# Mac: double-click this file. Linux: run  bash СТАРТ-mac-linux.command
cd "$(dirname "$0")" || exit 1

echo
echo "  =================================================="
echo "     ZOMBIE SURVIVAL 3D  -  relay-сервер для коопу"
echo "  =================================================="
echo

if ! command -v node >/dev/null 2>&1; then
  echo "  [!] Node.js не встановлено."
  echo "      Постав його з https://nodejs.org (кнопка LTS) і запусти файл знову."
  echo
  read -r -p "  Натисни Enter щоб закрити..." _
  exit 1
fi

if [ ! -d node_modules ]; then
  echo "  Перший запуск — встановлюю потрібне (разова дія)..."
  echo
  npm install || { echo; echo "  [!] Не вдалося встановити. Перевір інтернет."; read -r -p "  Enter..." _; exit 1; }
  echo
fi

echo "  ---------------------------------------------------"
echo "   Запускаю сервер. НЕ ЗАКРИВАЙ це вікно під час гри!"
echo "   Щоб зупинити — натисни Ctrl+C або закрий вікно."
echo "  ---------------------------------------------------"
echo
npm start

echo
read -r -p "  Сервер зупинено. Натисни Enter..." _
