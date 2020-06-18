# My experiance on setup of gns3(Arch Linux)

Checking for prequisites:

```sh
$ sudo -ll
[sudo] password for raytracer:
Matching Defaults entries for raytracer on server:
    insults

User raytracer may run the following commands on server:

Sudoers entry:
    RunAsUsers: ALL
    Commands:
	ALL
$ sudo pacman -Qg base-devel
base-devel autoconf
base-devel automake
base-devel binutils
base-devel bison
base-devel fakeroot
base-devel file
base-devel findutils
base-devel flex
base-devel gawk
base-devel gcc
base-devel gettext
base-devel grep
base-devel groff
base-devel gzip
base-devel libtool
base-devel m4
base-devel make
base-devel pacman
base-devel patch
base-devel pkgconf
base-devel sed
base-devel sudo
base-devel texinfo
base-devel which
$ python3 -v
Python 3.8.3
```

## Dynamips

Get all dependencies for dynamips
```sh
$ sudo pacman -S libelf libpcap cmake
```
If using `yay` or another aur helper, you can use:
```sh
$ yay -S dynamips
```
or you can grap the latest version from here [dynamips](https://github.com/GNS3/dynamips/releases)
and install in following way:
```sh
$ cd Downloads
$ curl -L https://github.com/GNS3/dynamips/archive/v0.2.17.tar.gz | tar -xz
$ cd dynamips*
$ mkdir build && cd $_
$ cmake ..
$ sudo make install
```
and then set the file capabilities:
```sh
$ sudo setcap cap_net_admin,cap_net_raw=ep $(which dynamips)
```

Verify the version and capabilities:
```sh
$ dynamips 2>/dev/null | grep version
Cisco Router Simulation Platform (version 0.2.21-amd64/Linux stable)
$ getcap $(which dynamips)
/usr/bin/dynamips = cap_net_admin,cap_net_raw+ep
```

## VPCS(Virtual PC Simulator)

With `yay` do:
```sh
$ yay -S vpcs
```
or you can do:
```sh
$ sudo pacman -S subversion
$ cd /tmp
$ svn checkout svn://svn.code.sf.net/p/vpcs/code/trunk vpcs-code
$ cd vpcs-code/src
$ rgetopt='int getopt(int argc, char *const *argv, const char *optstr);'
$ sed -i "s/^int getopt.*/$rgetopt/" getopt.h
$ unset -v rgetopt
$ sed -i 's/i386/x86_64/' Makefile.linux
$ sed -i 's/-s -static//' Makefile.linux
$ make -f Makefile.linux
$ strip --strip-unneeded vpcs
$ sudo mv vpcs /usr/local/bin
```
or
```sh
git clone https://github.com/GNS3/vpcs.git
cd vpcs/src
sh mk.sh
cp vpcs /usr/local/bin/
chmod +x /usr/local/bin/vpcs
cd ../..
```
For me none of the method worked to 2020-06-16, will update if got it working


## IOUYAP

Install iniparser for IOUYAP
```sh
$ sudo pacman -S iniparser
```

