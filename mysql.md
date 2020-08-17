# Using mysql(mariadb) through commandline

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
