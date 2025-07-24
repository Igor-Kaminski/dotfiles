chosen=$(echo -e "⏻  Power Off\n  Reboot\n⏏  Logout" | \
    wofi --dmenu --width 200 --height 150 --location 3 --style ~/.config/waybar/scripts/powermenu.css)

# Remove icons before matching:
cmd=$(echo "$chosen" | sed 's/^[^[:alnum:]]*//')  # strip leading non-alphanumeric chars

case "$cmd" in
    "Power Off") systemctl poweroff ;;
    "Reboot") systemctl reboot ;;
    "Logout") loginctl terminate-user "$USER" ;;
esac
