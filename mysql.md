# Using mysql(mariadb) through commandline

## Edit configuration file of mysql

mysql runs as a system service, you can find out its configuration file at `/etc/mysql/my.cnf` or `/etc/my.cnf` depends on distribution.

## Check and enable/disable mysql service

This will apply on systemd systems:

```sh
$ sudo systemctl status mysqld.service

● mariadb.service - MariaDB 10.4.13 database server
	 Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; vendor preset: disabled)
	 Active: active (running) since Mon 2020-08-17 11:29:03 IST; 1 day 7h ago
	   Docs: man:mysqld(8)
			 https://mariadb.com/kb/en/library/systemd/
	Process: 124160 ExecStartPre=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
	Process: 124161 ExecStartPre=/bin/sh -c [ ! -e /usr/bin/galera_recovery ] && VAR= ||   VAR=`cd /usr/bin/..; /usr/bin/galera_recover>
	Process: 124266 ExecStartPost=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
   Main PID: 124172 (mysqld)
	 Status: "Taking your SQL requests now..."
	  Tasks: 30 (limit: 4054)
	 Memory: 65.7M
	 CGroup: /system.slice/mariadb.service
			 └─124172 /usr/bin/mysqld

Aug 17 11:29:03 server mysqld[124172]: 2020-08-17 11:29:03 0 [Note] Server socket created on IP: '::'.
Aug 17 11:29:03 server mysqld[124172]: 2020-08-17 11:29:03 0 [Note] Reading of all Master_info entries succeeded
```

To enable and start service:

```sh
$ sudo systemctl enable mysqld.service
Created symlink ......

$ sudo systemctl start mysqld.service
```

To disable service:

```sh
$ sudo systemctl disable mysqld.service
```

## using mysql through terminal

This is tested on linux

> Note: queries for mysql are case-insensitive for most cases

## Current User list

Login to your `root` mysql account

```sh
$ sudo mysql -u root -p
```

You will be prompted for your root account password of your system then for mysql root account. Enter both passwords.

Now, enter following query to see current user list:

```sql
[(none)]> SELECT USER,Host from mysql.user;
```

A table of users will be displayed.

## Creating new user

Enter the following query to create new user:

```sql
CREATE USER 'username'@'localhost' IDENTIFIED BY 'yourpasswordhere'
```

You can put other server name instead of `localhost`(I think)

## Granting Permission to User

You need to login as root into mysql.

A basic query syntax could be like this:

```sql
> GRANT permission ON database.table To 'username'@'localhost'
```

This will give the specified permission to the specified user on the specified database table

A short list of permission is given here:

<table>
	<tr>
		<th>
			Permission Name
		</th>
		<th>
			Description
		</th>
	</tr>
	<tr>
		<td>
			ALL
		</td>
		<td>
			Allow complete access to specified database. If a database is not specified, allows complete access to entirety of MYSQL.
		</td>
	</tr>
	<tr>
		<td>
			CREATE
		</td>
		<td>
			Allow a user to create databases and tables.
		</td>
	</tr>
	<tr>
		<td>
			DELETE
		</td>
		<td>
			Allow a user to delete rows from table.
		</td>
	</tr>
	<tr>
		<td>
			DROP
		</td>
		<td>
			Allow a user to drop databases and tables.
		</td>
	</tr>
	<tr>
		<td>
			EXECUTE
		</td>
		<td>
			Allow a user to execute stored routine
		</td>
	</tr>
	<tr>
		<td>
			GRANT OPTION
		</td>
		<td>
			Allow a user to grant or remove another user's privileges.
		</td>
	</tr>
	<tr>
		<td>
			INSERT
		</td>
		<td>
			Allow a user to insert rows from a table
		</td>
	</tr>
	<tr>
		<td>
			SELECT
		</td>
		<td>
			Allow a user to select data from database
		</td>
	</tr>
	<tr>
		<td>
			SHOW DATABASES
		</td>
		<td>
			Allow a user to show a list of all databases
		</td>
	</tr>
	<tr>
		<td>
			UPDATE
		</td>
		<td>
			Allow a user to update rows in a table
		</td>
	</tr>
</table>
