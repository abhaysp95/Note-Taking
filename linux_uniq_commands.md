Here are some of the unix/linux commands which I found useful from time to time:

# imagemagick

* To blur a specific part of image:
```sh
:~/.cache/temp  master(+1690/-12) 1s ± convert 2020-04-13-063935_1134x302_scrot.png \( -clone 0 -fill white -colorize 100 -fill black -draw "polygon 70,25 70,45 200,45 200,25" -draw "polygon 240,45 240,65 640,65 640,45" -draw "polygon 290,65 290,85 675,85 675,65" -draw "polygon 250,105 250,125 440,125 440,105" -draw "polygon 1090,205 1090,225 1125,225 1125,205" -draw "polygon 0,225 0,245 100,245 100,225" -alpha off -write mpr:mask +delete \) -mask mpr:mask -blur 0x3 +mask blurred.png
```
Co-ordinates are like - top,left bottom,left bottom,right top,right

* To get colors out of image(I had written a script for this)
```sh
1z  :~/Documents/my_notes  master* 5s 148 ± convert ~/.config/wall.png +dither -colors 10 -define histogram:unique-colors=true -format "%c" histogram:info: > getcolor.txt
```

* To get a specific line from a command output, in the following example I want to get second line:
```sh
$ mpc
Shankar, Ehsaan, Loy, Raman Mahadevan, Mani Mahadevan, Siddharth Mahadevan & Suhas Sawant - Zinda - PagalWorld.com
[playing] #858/1235   0:58/3:31 (27%)
volume:100%   repeat: off   random: on    single: off   consume: off
$ mpc | sed -n '2 p'
[playing] #858/1235   1:59/3:31 (56%)
$ mpc | awk 'NR==2'
[playing] #858/1235   2:40/3:31 (75%)
```

From the above example, I want to get status, playing/paused
```sh
$ mpc
Shankar, Ehsaan, Loy, Raman Mahadevan, Mani Mahadevan, Siddharth Mahadevan & Suhas Sawant - Zinda - PagalWorld.com
[playing] #858/1235   0:58/3:31 (27%)
volume:100%   repeat: off   random: on    single: off   consume: off
$ mpc | sed -n '2 p' | cut -d '[' -f 2 | cut -d ']' -f 1
playing
```

## Extract windows fonts from its iso
Download windows10 iso. Download 7z
```sh
$ sudo pacman -S p7zip
$ 7z e Window10xxxxx.iso source/install.wim  # you can put another name, but it
# should be of wim type
$ 7z e install.wim 1/Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} -ofonts/
```
