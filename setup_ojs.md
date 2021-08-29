# Open Journal System Setup

As mentioned in it's official website, `Open Journal Systems (OJS) is an open source software application for managing and publishing scholarly journals.`

You can checkout official webiste [here](https://pkp.sfu.ca/ojs/) for more info or visit its github repo [here](https://github.com/pkp/ojs).

## Setup LAMP

You need to fulfill the requirements to install `ojs`. I'm going with `LAMP`(_Linux, Apache, Mariadb(mysql), PHP_). I've written a guide to install it on `Arch Linux` based distros [here](https://github.com/coolabhays/Note-Taking/blob/master/setup_LAMP.md).

## Download OJS

Download `ojs` from its official website. Link provided [here](https://pkp.sfu.ca/ojs/download/ojs-3.3.0-7.tar.gz) for download. You'll download a compressed `*.tar.gz` file.

## Installation

Extract the download tarball of `ojs` in `/srv/http` using following command:

```sh
$ cd /srv/http
$ tar xzvf /path/to/<ojs>.tar.gz
```

## Setup user and permission:

As mentioned in `installation` page from `ojs`'s official website. You need to make few files(folders) writable(by changing owner and permission). You'll need to use two commands for that, and you'll also need superuser privilege for doing so.

Get the user-name of your apache server. In my case, it's _http_(I got it from checking `/etc/passwd`) file.

```sh
$ sudo chown -R http public cache config.inc.php
```

You also need to create an extra directory to keep the stuff of/for uploading to your `ojs` setup. Create it someplace else(not where you are putting the contents of ojs you extracted from the downloaded tarball).

```sh
$ mkdir -p /usr/share/ojs_files
$ sudo chown http /usr/share/ojs_files
```

## Confirm that everything is running properly


I'm currently running a `systemd` operating system. If you're using `init`(based system, like OpenRC, runit etc.) system use `service` command.

```sh
$ sudo systemctl status httpd.service
$ sudo systemctl status mysqld.service
```

In case, you found them `inactive(dead)`. Use `start`(or _restart_ as needed) instead of _status_ in above command.

Next, open you browser and go to `localhost`. You'll see the `ojs on-screen installation` page.


## Doing setup for installation

If you want to increase the size limit of the capacity of the files you wanna upload. Do following:

Open `/etc/php7/php.ini` in your preffered editor(`vim/nano` are most likely gonna be found in most system already. I prefer _vim_). Find the line under `File Uploads` section which looks like this:
```
upload_max_filesize = 2M
```

Change the capacity to your desire(like _1G_).

Save the file and restart the server(command told above) and refresh the page in browser(you'll notice the change there too).


Next, for setting up database. You need to pay attention that options provided doesn't have `[]` surrouded. For this, you need to have appropriate `php driver` installed for those databases.
You can install most of the option's driver from your distros official repositories(like php-sqlite, php-mongodb etc.). In my case, I'm going with `mariadb`(and I hope you already have done the setup as told above in first paragraph).

For this setup(since I'm currently in Arch linux), there's not `php7-msql` or like that any other module for mariadb(mysql). Instead, you need to enable it as extension as told [here](https://wiki.archlinux.org/title/PHP#MySQL/MariaDB). Do it like this:

```
$ sudo vim /etc/php7/php.ini
```

Find line with
```
;extension=mysqli
...
;extension=pdo_mysql
```

Uncomment those two lines(remove `;` from the start of the line). Save the file and restart the server. Now, you're all set to do the setup.

Refresh the page in browser again, fill up the fields. Another thing, you need to keep in mind is that, for database you need to select `mysqli` from the menu(notice that `[]` is not surrounding it now).

Whatever, information regarding _database name_, _username_ and _password_ you fill, you need to create that database and provide the privileges for that user yourself manually. I think, `ojs` is not going to do it for you. I've already told how to create `database` and provide _privileges_ for user already in my [setup LAMP](https://github.com/coolabhays/Note-Taking/blob/master/setup_LAMP.md) already.

You need to make sure that whatever information you enter for database fields in installation page is same to the manual setup of database in mariadb.

Click on the bottom-right button to do the installation. With hope, you should not get any error now. After successful installation, login with your new credentials and _Voila_, start putting up some good journals now.
