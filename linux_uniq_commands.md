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

## User Installed package

To know user installed packages that aren't strict dependancy of any other package or group, this doesn't count `base` and `base-devel`
```sh
$ comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq) > uninstall_packages.txt
```
If you want to include _explicitly installed packages_ that are also dependancies of some other package, you can use `Qqe` instead `Qqett`.

## get pid of the process which runs it

```sh
$ echo "$$"
```

This will give the pid of the process which ran it

## Info about signals for process

use, `man kill`, `man 7 signal` or checkout [this link](https://en.wikipedia.org/wiki/Signal_(IPC)#POSIX_signals)

here's the table
| Number | Signal  |
| :---:  | :---:   |
| 0	     |  0      |
| 1	     |  HUP    |
| 2	     |  INT    |
| 3	     |  QUIT   |
| 4	     |  ILL    |
| 5	     |  TRAP   |
| 6	     |  ABRT   |
| 7	     |  BUS    |
| 8	     |  FPE    |
| 9	     |  KILL   |
| 10     |	USR1   |
| 11     |	SEGV   |
| 12     |	USR2   |
| 13     |	PIPE   |
| 14     |	ALRM   |
| 15     |	TERM   |
| 16     |	STKFLT |
| 17     |	CHLD   |
| 18     |	CONT   |
| 19     |	STOP   |
| 20     |	TSTP   |
| 21     |	TTIN   |
| 22     |	TTOU   |
| 23     |	URG    |
| 24     |	XCPU   |
| 25     |	XFSZ   |
| 26     |	VTALRM |
| 27     |	PROF   |
| 28     |	WINCH  |
| 29     |	POLL   |
| 30     |	PWR    |
| 31     |	SYS    |

## merge video and audio

A basic approach to merge audio and video with `ffmpeg`

```sh
$ ffmpeg -i <video_file> -i <audio_file> -c:v copy -c:a aac <outfile_file>
```

You could give `mkv` extension to output file or other if you know what
you're doing
