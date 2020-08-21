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

### Get the port number

To know at actually which port you mysql service is running, enter following command:
```sh
$ sudo netstat -tnlp | grep -i mysql | awk '{print $4}' | cut -c 4-
3306
```

## using mysql through terminal

This is tested on linux

> Note: queries for mysql are case-insensitive for most cases

## setup for the first time

You can enter following command for first time setup:

```sh
$ sudo mysql_secure_installation
```


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
> GRANT [privilege1, privilege2] ON [database].[table] TO '[user]'@'localhost';
```
for example:

```SQL
> GRANT ALL PRIVILEGES ON test.* TO 'user'@'localhost'
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

## List all mysql databases

Enter with user you want to show database of or enter with root access and enter following query:

```SQL
> SHOW DATABASES;
```

If you are using some database and your sql prompt isn't showing database name, you can use following query to show database name you're currently working on:

```SQL
> SELECT DATABASE();
```

## List all tables

To show all the from a database:

```SQL
> SHOW TABLES FROM "database name";
```

You don't need to provide the database name if you want to list the tables of the database you are using right now


## List all the columns of table

Use the following query/ies:

```SQL
> SHOW COLUMNS FROM "table" FROM "database";
-- or
> SHOW COLUMNS FROM "database"."table";
-- or
> SHOW COLUMNS FROM "table";
```

## Creating a Database

You need to create a database before you can create the table. So, to create database, insert query like this with `root` user for specified user(or root).

But if you have created a new user, you have to grant the required permission first according to the need

```SQL
> GRANT ALL PRIVILEGES ON practice.* TO 'username'@'localhost'
```

This will give all the permission to `username` for `practice` database.

Now, if you want login back with that new user.

Now, time to create the database,

After logging back with the 'username', enter following query:

```SQL
> CREATE DATABASE practice;
```

This will create the database with `practice`

To use this database, enter:

```SQL
> USE practice;
```

This will change the prompt from something like this `MariaDB [(none)]>` to something like this `MariaDB [practice]>`.

## Creation of table

Now, its time to create the table, basic mysql syntax for creating table could look like this:

```SQL
> CREATE TABLE [table_name] (column1_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT], column2_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT] ... );
```

For example, you can create `table` with something like this:

```SQL
CREATE TABLE Person ( ID INT NOT NULL AUTO_INCREMENT, First_Name VARCHAR(32) NOT NULL, Last_Name VARCHAR(32) DEFAULT 'Nothing', Email VARCHAR(32) DEFAULT 'Not-Provided', Date_Added DATE, PRIMARY KEY ( ID ) );
```

This will create the table named `Person`.

Now, enter some queries like this:

```SQL
> INSERT INTO Person ( First_Name, Last_Name, Date_Added ) VALUES ('Raven', 'Claw', '2020-08-16');
```

And you created a row in the table

To view the table you can query:

```SQL
MariaDB [practice]> SELECT * FROM Person;


+----+------------+-----------+-----------------------+------------+
| ID | First_Name | Last_Name | Email                 | Date_Added |
+----+------------+-----------+-----------------------+------------+
|  1 | Richard    | Williams  | Richard@Williams.xyz  | 2020-08-18 |
|  2 | Selena     | Smith     | selena123smith@gb.com | NULL       |
|  3 | Selena     | Nothing   | selena123smith@gb.com | NULL       |
|  4 | Raven      | Claw      | Not-Provided          | 2020-08-16 |
+----+------------+-----------+-----------------------+------------+
4 rows in set (0.001 sec)
```

There you go, you have created a table named `Person` inside `practice` database
