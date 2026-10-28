#!/bin/bash
# повторный клик по кнопке закрывает меню
pgrep -x wofi >/dev/null && { pkill -x wofi; exit; }

BG="/home/haiku/Загрузки/macos-mojave-starry-5120x2880-24090.jpg"

choice=$(printf 'Блокировка\nВыход из сессии\nПерезагрузка\nВыключение' | wofi --dmenu \
    --prompt "" --cache-file /dev/null --lines 4 --width 240 \
    --location 3 --xoffset -8 --yoffset 36 --no-actions \
    --style /home/haiku/.config/wofi/power.css 2>>/tmp/powermenu.log)

case "$choice" in
    "Блокировка")      swaylock -f -i "$BG" -c 000000 ;;
    "Выход из сессии") swaymsg exit ;;
    "Перезагрузка")    systemctl reboot ;;
    "Выключение")      systemctl poweroff ;;
esac
