---
layout: article
title: Setup LAMP on Linux
author: Abhay Shanker Pathak
date: 2020-05-29
---

This article is specifically based on `Arch base distros`.

# Update

First, update your system
```sh
$ sudo pacman -Syu
```

# Install Apache

```sh
$ sudo pacman -S apache
```

Now, edit **/etc/httpd/conf/httpd.conf** and comment out following line if not
already commented

```
#LoadModule unique_id_module modules/mod_unique_id.so
```

## Enable Apache

Enable Apache service to start at boot and start Apache service

```sh
$ sudo systemctl enable httpd.service
$ sudo systemctl start httpd.service
```

You can verify it by running

```sh
$ sudo systemctl status httpd.service
● httpd.service - Apache Web Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
     Active: active (running) since Fri 2020-05-29 20:44:10 IST; 1h 26min ago
   Main PID: 1523440 (httpd)
      Tasks: 11 (limit: 4051)
     Memory: 89.4M
     CGroup: /system.slice/httpd.service
             ├─1523440 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523445 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523446 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523447 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523449 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523544 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523552 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523553 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523554 /usr/bin/httpd -k start -DFOREGROUND
             ├─1523555 /usr/bin/httpd -k start -DFOREGROUND
             └─1533887 /usr/bin/httpd -k start -DFOREGROUND

May 29 20:44:10 server systemd[1]: Started Apache Web Server.
May 29 20:44:10 server httpd[1523440]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. S>
May 29 20:44:58 server phpMyAdmin[1523552]: user denied: root (mysql-denied) from ::1
May 29 20:45:50 server phpMyAdmin[1523554]: user denied: root (mysql-denied) from ::1
```

## Test Apache

Let's create a sample page in `Apache` root directory which is **/srv/http**

```sh
$ sudo vim /srv/http/index.html
```

Add the following line

```sh
<html>
	<title>Welcome</title>
	<body>
		<h2>Welcome to raytracer server</h2>
	</body>
</html>
```


Now, open your preferred browser and type in url
**http://localhost** or **http://<ip-address>**


# Setting up MySQL

To install `MariaDB`, run

```sh
$ sudo pacman -S mysql
```

Choose default(1) option for MariaDB while installation. `MariaDB` is now
officially default implementation of MySQL in Arch Linux since 2013.

To initialize the MariaDB data directory prior to starting the service, run

```sh
$ sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```

## Enable MySQL Service

To start MariaDB service, execute following command:

```sh
$ sudo systemctl enable mysqld
$ sudo systemctl start mysqld
```

Check status with

```sh
$ sudo systemctl status mysqld
● mariadb.service - MariaDB 10.4.12 database server
     Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; vendor preset: disabled)
     Active: active (running) since Fri 2020-05-29 18:20:20 IST; 4h 2min ago
       Docs: man:mysqld(8)
             https://mariadb.com/kb/en/library/systemd/
    Process: 1499116 ExecStartPre=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
    Process: 1499117 ExecStartPre=/bin/sh -c [ ! -e /usr/bin/galera_recovery ] && VAR= ||   VAR=`/usr/bin/galera_recovery`; [ $? -eq 0 ]   && sy>
    Process: 1499158 ExecStartPost=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
   Main PID: 1499125 (mysqld)
     Status: "Taking your SQL requests now..."
      Tasks: 30 (limit: 4051)
     Memory: 70.6M
     CGroup: /system.slice/mariadb.service
             └─1499125 /usr/bin/mysqld

May 29 18:20:20 server mysqld[1499125]: 2020-05-29 18:20:20 0 [Note] Reading of all Master_info entries succeeded
May 29 18:20:20 server mysqld[1499125]: 2020-05-29 18:20:20 0 [Note] Added new Master_info '' to hash table
May 29 18:20:20 server mysqld[1499125]: 2020-05-29 18:20:20 0 [Note] /usr/bin/mysqld: ready for connections.
May 29 18:20:20 server mysqld[1499125]: Version: '10.4.12-MariaDB'  socket: '/run/mysqld/mysqld.sock'  port: 3306  Arch Linux
May 29 18:20:20 server systemd[1]: Started MariaDB 10.4.12 database server.
May 29 18:32:46 server mysqld[1499125]: 2020-05-29 18:32:46 12 [Warning] Access denied for user 'root'@'localhost'
May 29 18:33:00 server mysqld[1499125]: 2020-05-29 18:33:00 13 [Warning] Access denied for user 'root'@'localhost'
May 29 18:33:10 server mysqld[1499125]: 2020-05-29 18:33:10 14 [Warning] Access denied for user 'root'@'localhost'
May 29 20:44:58 server mysqld[1499125]: 2020-05-29 20:44:58 18 [Warning] Access denied for user 'root'@'localhost'
May 29 20:45:50 server mysqld[1499125]: 2020-05-29 20:45:50 19 [Warning] Access denied for user 'root'@'localhost'
```

> You can also use mariadb.service inplace of mysqld


## Setup MySQL/MariaDB root user password

It is recommended to setup a password for database root user. Use
**mysql_secure_installation**
It's basically a shell script. This will ask you some questions like
`to allow anonymous log` something like this

```sh
$ sudo mysql_secure_installation
```
```
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!


In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.


Enter current password for root (enter for none):
OK, successfully used password, moving on...


Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.


You already have a root password set, so you can safely answer 'n'.


Change the root password? [Y/n] n
 ... skipping.


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.


Remove anonymous users? [Y/n] y
 ... Success!


Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.


Disallow root login remotely? [Y/n] y
 ... Success!


By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.


Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!


Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.


Reload privilege tables now? [Y/n] y
 ... Success!


Cleaning up...


All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.


Thanks for using MariaDB!
```

# Install PHP

To install PHP in arch, run:

```sh
$ sudo pacman -S php php-apache
```

After installation, we need to configure Apache PHP module:

```sh
$ sudo vim /etc/http/conf/httpd.conf
```

Comment this line:

```
#LoadModule mpm_event_module modules/mod_mpm_event.so
```

And add following lines:

```apache
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
LoadModule php7_module modules/libphp7.so
AddHandler php7-script php
Include conf/extra/php7_module.conf
```

In some cases, first line in above section(mpm_prefork_module) is already added,
so no need(do check thoroughly).


## Test PHP

Now, lets test php, create a file **test.php**(any name) in your Apache root
directory

```sh
$ sudo vim /srv/http/test.php
```

And, add the following lines

```php
<?php
phpinfo();
?>
```

Restart Apache server

```sh
$ sudo systemctl restart httpd.service
```

Open your browser and run **http://localhost/test.php**

# Install phpMyAdmin

phpMyAdmin is graphical MySQL/MariaDB administration tool that can be used to
create, edit and delete databases.

To install run:

```sh
$ sudo pacman -S phpmyadmin
```

If your distro package have **php-mcrypt** then install else it is probably
dropped(don't worry about it)

Now, after installation, edit **php.ini** file:

```sh
$ sudo vim /etc/php/php.ini
```

Uncomment following lines:

```ini
extension=bz2
extension=mysqli
; if you had installed mcrypt then
extension=mcrypt
; Note : The syntax used in previous PHP versions ('extension=<ext>.so' and
; 'extension='php_<ext>.dll') is supported for legacy reasons and may be
; deprecated in a future PHP major version. So, when it is possible, please
; move to the new ('extension=<ext>) syntax.
```
Next thing is, we should create configuration file for phpMyAdmin,

```sh
$ vim /etc/httpd/conf/extra/phpmyadmin.conf
```

And add then add following lines in it:

```apache
Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
<Directory "/usr/share/webapps/phpMyAdmin">
DirectoryIndex index.php
AllowOverride All
Options FollowSymlinks
Require all granted
</Directory>
```


Now, open Apache configuration file **/etc/httpd/conf/httpd.conf** and put
following line in the end:

```apache
Include conf/extra/phpmyadmin.conf
```

Save, close and restart Apache(httpd) service

Test in browser **http://localhost/phpmyadmin** and you should be grand by a
login page from phpmyadmin


If you see an error that says **"The configuration file now needs a secret
passphrase (blowfish_secret)"** at the bottom of phpMyAdmin dashboard,
to get rid of this error, edit **/etc/webapps/phpmyadmin/config.inc.php**

```php
$cfg['blowfish_secret'] = 'Welc0me1'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */
```

Here, **Welc0me1** is secret passphrase and then restart **httpd** service


# Error Login as root user in phpMyAdmin

If you try to enter as root in phpMyAdmin login, you'll get error something like
this
**mysqli::real_connect(): (HY000/1698): Access denied for user 'root'@'localhost'**

You can either created **magento database/user** or **mysql superuser**. I'm
going to tell how to create new superuser

Visit [how-to-create-mysql-user-account](https://linuxize.com/post/how-to-create-mysql-user-accounts-and-grant-privileges/)
for more detail

Do following:

* Create user(this is only for localhost)
```
mysql> CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'user_password';
```

* Give privileges(providing all privileges to all databases)

```
mysql> GRANT ALL PRIVILEGES ON *.* TO 'database_user'@'localhost';
```

* Flush privileges(makes changes appear)

```
mysql> FLUSH PRIVILEGES
mysql> exit
```
All set, now you can login with your newly created login and password
