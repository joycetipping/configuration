#!/bin/sh
openbox &
wm_pid=$!

env=$HOME/projects/env

init_session() {
  #xset r rate 150 60
  xrdb ~/.Xresources
  feh --bg-fill $env/bgi
  xcompmgr &
  tint2 &
  pnmixer &
  #ibus-daemon -rdx &

  case `hostname` in
  iota|ijen|iya)
    $env/touchpad
    $env/battery-limits

    # shenanigans: conky works only at DPI=112
    echo 'Xft.dpi: 96' | xrdb -merge
    sleep 1
    conky &
    sleep 3
    xrdb ~/.Xresources
    xscreensaver &

    wifi 35
    sudo wg-quick up wg0
    sudo mount /mnt/v1
    sudo mount /mnt/nvme
    sudo mount /mnt/shared
    ;;

  iniidae)
    # Work around Lenovo's pathological End/Insert key overloading on the X250
    xmodmap -e 'keycode 118 = End'

    # Fix screen colors, unscientifically
    # xgamma -rgamma 1.2 -ggamma 1.2 -bgamma 1.5

    xrandr --output eDP-1 --off
    xrandr --output HDMI-1 --primary --rotate left

    # No DPMS: display should always be running
    xset dpms 0 0 0
    xset s off
    xset -dpms
    ;;

  *)
    echo "got unknown hostname $HOSTNAME"
    ;;
  esac

  #setlayout 0 10 10 0
}

sleep 2 && init_session

wait $wm_pid

# NOTE:
# suggested changes from https://bbs.archlinux.org/viewtopic.php?id=265880:
# exec openbox-session at the end, (sleep 2 && init_session) & async
