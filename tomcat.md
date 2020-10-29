# Using Tomcat

### Scenerio

I have apache2 already installed and running. So, the question infront of me was `how to integrate apache tomcat* with apache http server`?

At the time of this process, I'm using `Manjaro`(arch-linux based distro) in this machine. And I have `httpd.service` up and running

This is what I did:

## Steps:

### Installation:

I installed `tomcat9` through `pacman`(available in _extra_ package):

```
$ sudo pacman -S tomcat8
```

This installed `tomcat9` on my machine. Now, there's two ways two ways to run `tomcat`, _automatic_ and _manual_. I first tried automatic.
Btw, `tomcat`, by-default uses 8080 port(keep this in mind). But first, here is the File hierarchy for `tomcat`:


| **Pathname**              | **Use**                                                              |
| :---:                     | :---:                                                                |
| /etc/tomcat*              | Contains configuration files, like `tomcat-users.xml`                |
| /usr/share/tomcat*        | Main tomcat folder containing scripts and links to other directories |
| /usr/share/java/tomcat/*  | Tomcat java libraries(jars)                                          |
| /var/log/tomcat*          | Log files( not handled by systemd )                                  |
| /var/lib/tomacat*/webapps | Where tomcat deploys your web applications                           |
| /var/tmp/tomcat*          | Where tomcat store you webapp's data                                 |


### Running:

**Manual**:

You can find `startup.sh` and `shutdown.sh` script in `/usr/share/tomcat*/bin` directory. You have to be root user to execute these scripts, since these are owned by root user, or you can setup particular user(individual user) to execute these files.

Once executed, you'll see some info in your terminal. You can now access tomcat through `http://localhost:8080`.


```
Note: There are several settings which can be done, I'll update as I'll feel it
```
