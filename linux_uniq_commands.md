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
