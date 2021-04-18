set -x
set -e

focused_window=$(xdotool getwindowfocus)
focused_app_pid=$(xprop -id $focused_window | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')
focused_app_command=$(ps -o comm= --pid $focused_app_pid)

window_name=$(xdotool getactivewindow getwindowname)
grep_for_vim=' - (view|n?vim?x?)(diff)?$'
grep_for_path=''

if echo "$window_name" | grep -iqE -e "$grep_for_vim" && echo $focused_app_command | grep alacritty; then
  echo "xdotool the ol vim switcheroo"
  i3-msg mode "switcheroo"
  xdotool key --window $focused_window "ctrl+$1"
  i3-msg mode "default"
#elif echo $focus_app_command | grep urxvt; then
else
  echo "doin that i3 thang"
  case "$1" in
    h)
      i3-msg focus left
      ;;
    j)
      i3-msg focus down
      ;;
    k)
      i3-msg focus up
      ;;
    l)
      i3-msg focus right
      ;;
  esac
fi

