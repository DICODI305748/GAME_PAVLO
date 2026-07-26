#!/usr/bin/env bash
# Zombie Survival 3D — local server launcher (Mac / Linux)
# Mac: double-click. Linux: run  bash ЗАПУСК-ГРИ.command
cd "$(dirname "$0")" || exit 1

URL="http://localhost:8000"
echo
echo "  🎮 Запускаю гру на $URL  (не закривай це вікно)"
echo

# open the browser shortly after the server starts
( sleep 2; (command -v open >/dev/null && open "$URL") || (command -v xdg-open >/dev/null && xdg-open "$URL") ) >/dev/null 2>&1 &

if command -v python3 >/dev/null 2>&1; then
  python3 -m http.server 8000
elif command -v node >/dev/null 2>&1; then
  node server-static.js
else
  echo "  [!] Немає Python3 чи Node.js. Постав Node.js з https://nodejs.org і запусти знову."
  read -r -p "  Enter..." _
fi
