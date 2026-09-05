# Setup another machine
```
chezmoi init --apply --verbose https://github.com/lefterisALEX/dotfiles.git
```

xrandr --output HDMI-A-1 --mode 2560x1080 --rate 50
xrandr --output HDMI-A-1 --mode 2560x1080 --rate 60
xrandr --output HDMI-A-1 --mode 1920x1080 --rate 60


xrandr --newmode "2560x1080R" 181.25 2560 2608 2640 2720 1080 1083 1093 1111 +hsync -vsync
xrandr --addmode HDMI-A-1 "2560x1080R"
xrandr --output HDMI-A-1 --mode "2560x1080R"


make it persistent
~/.xprofile

```
xrandr --newmode "2560x1080R" 181.25 2560 2608 2640 2720 1080 1083 1093 1111 +hsync -vsync
xrandr --addmode HDMI-A-1 "2560x1080R"
xrandr --output HDMI-A-1 --mode "2560x1080R"
```
## others
cvt -r 2560 1080 50
xset -dpms
xset s off


# hard reset
xrandr --output HDMI-A-1 \
  --scale 1x1 \
  --transform none \
  --panning 0x0 \
  --mode 2560x1080R

