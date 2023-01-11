# Maven

## origin

-- by Apache

* std way to build project
* clarity on what project consists of
* simplified project info
* sharing of jar's project

`To simply the build project in Jakarta Turbine Project`

### adv

* build and dev. tool
* dependency mgmt system
* uniform build system
* auto-upgrade versions
* better development practices

## What is Maven

Open source automation tool, build and manage any java project, launched by Apache 2004

Uniform build, using POM

Provides quality project information

Better dev. practices

```
POM.xml => project related configuration details
Settings.xml => configuration file for specifying global settings
Dependency => external jar files required for compiling, building, testing or running projects
Plugin => small components used for specific task
Repository => location where dependencies and plugins are stored

Build => compile -> package -> deploy
Packaging => files of project are bundled together to make a distributable form of application
```

### Types of packaging in Java

JAR, WAR, EAR, POM, EJB, Maven Plugin

Maven (build mgmt too) ensures that:
* all build steps are consitently followed
* failures are taken care of
* downloading and managing all artifacts

## Maven benefitting development process

* Std. project structure
* Dependency mgmt
* Tool portability and integration
* Repository maintenance, eg., Nexus
* Build mgmt
* Open source support

## Maven from command-line

### First command

Let's check different subcommands (& flags)
```
archetype:generate => type of maven project you want to create
-DgroupId=com.infy.HelloWord => tell the groupId to use instead of default one
-DartifactId=HelloWorld => tell to use artifactId instead of default
-DarchetypeArtifactId=maven-archetype-quickstart => specify the maven archetype as quickstart
-DarchetypeVersion=1.4 => set the version of archetype
-DinteractiveMode=false
```

`generate` goal will use the values passed in from the commandline

`mvn package` to compile and pack to sharable format, (run this command under the root directory of your project, which was created by above command)

```sh
$ cd target/classes
$ java -cp ../HelloWorld...jar com.infy.HelloWorld.App
```

Use the above commands to run the project.


### Dependency Mgmt

allows you to merge and centralize the mgmt of dependency versions without adding dependencies which are inherited by all children.

`Dependencies` column list all the used dependency in your project


### MAVEN Archetypes and Project structure

* Archetypes are project template for creating projects
* Archetypes distribute project templates
* Project structure refers to: file/folder structure and location
* Archetypes are jar packages containing project template metadata
* Best practices suggested by projects
* Seperate directories
* Consistency among projects
* If skipped archetype selection: then project will be created with std name and directory layout

**Advantages:**

* Predefined project structure
* Default dependencies
* Allows customiation
* Saves development time

**Default Archetypes by Maven**

* maven-archetype-quickstart
* maven-archetype-webapp
* maven-archetype-archetype: used to create simple archetype project, metadata stored in meta-inf/maven/archetype.xml
* maven-archetype-plugin-site
