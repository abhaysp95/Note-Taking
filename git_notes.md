# Notes on Git/Github

## Overview of .git folder:

Initialize a git repository:

```sh
$ mkdir learn_git
$ git init learn_git
```

git's file system is stored inside `.git` folder and its objects are stored inside `objects` folder inside _.git_ folder.

`Note: Any manual change is not recommended inside .git folder`


## Git Object Types:

There are 4 object types:

* Blob
* Tree
* Commit
* Annotated Tag

### Brief Overview of Object types:

* **Blob**: git stores files(any file with any extension any type) in this type of object.
* **Tree**: git stores structure of directory(directories) in this object type and the tree can be set of blobs or other trees.
* **Commit**: With commit we are able to store different versions of our project.
* **Annotated Tag**: It is persistent text pointer to specific commit.

## Git Low-level Commands:

* **git hash-object**: create new git object and write it to git repo(create new blob object)
* **git cat-file**: read info of object and its content
* **git mktree**: able to create new tree object

<hr>

## git hash-object:

```sh
$ echo "hello, Git" | git hash-object --stdin
703a16bf2247dc35c60b5c2aa6a8783dc6222b5d
```

but nothing will be added to the objects inside to `.git` folder. You can check inside _.git/objects_. You need to write this blob,
```sh
$ echo "hello, Git" | git hash-object --stdin
703a16bf2247dc35c60b5c2aa6a8783dc6222b5d
```

Now, open _.git/objects_ and you will notice a directory named `70` and inside it a file with `3a16bf2247dc35c60b5c2aa6a8783dc6222b5d`. This means that git has added object into its file structure. Now, if combine the name of _file(3a16bf2247dc35c60b5c2aa6a8783dc6222b5d)_ and _directory(70)_ will get a hash, which is the hash of **hello, Git** string.

It means git creates folders and files(names) based on the hash of the provided input.


### What is Hash Function?

A Hash function is a function that takes variable length input and creates a fixed length hash. If you know hash but not input, you are not able to create that input based on hash and such functions are called _One-way Hash Function_. Hash functions will always generate same hash for same input and that's the reason they are also used for password authentication type stuffs too.

Some the important hash functions are: MD5(128), SHA1(160), SHA256(256), SHA384(384), SHA512(512) etc.
`the numbers inside the () after hash function tells the length of hash function in bit`

e.g.,
```sh
$ echo "hello, Git" | md5sum
085ad60ea04dc64b824c623e7c6b599a  -
$ echo "hello, Git" | sha1sum
d7f7912cabd3cbef8d69426fe623c4672de33214  -
$ echo "hello, Git" | sha256sum
2dbe448b040acd688da9966a0d965e643215f2fe2e36909d6a7b8f9226cdb748  -
$ echo "hello, Git" | sha384sum
7af5982555407e63c6668e4b25373d45c227117941b7ae8ca2e5f62a5af4a73bdcbf0a0d7e7ac05bf1f7530b7cf85dbd  -
$ echo "hello, Git" | sha512sum
f25b72c04aa48a441e14a4f7479c5650d127a79403f479e44b6d5c9d7e48db99752314c7a65724aef411eb7dfae6fb61318c18bf9763b20cdf76c014826e6270  -
```
### How many files can git repo store and what is the probability of hash collision here ?

As we now know that `git` uses `sha1` to create hashes so possible `sha1` combinations are **2 ^ 160**(binary format) or **40 hexadecimal char**. So, this was the answer of the first question.

as for second question:

```
+------------------------------------------------+
|               ((2 ^ 160) - 1)!                 |
|    ----------------------------------------    |
|    (2 ^ 160 - N)! * (2 ^ (160 * ( N - 1 )))    |
+------------------------------------------------+

where, 'N' is number of files

so, to have 100% git collision in a repository you need N > (2 ^ 160)
and that is very-very large number


also you can replace 2 ^ 160 with any other number, this was just because sha1sum
uses 160bit checksum

For eg., for a dice(6 faces):

+------------------------------+
|             5!               |
|   ------------------------   |
|    (6 - N)! * (6 ^ (N - 1))  |
+------------------------------+

and even probability of getting different numbers on all 6 dices is not exact 1
but round of 0.99...
```

Another way of creating objects is also to provide the filename, say we create a file(not in our git repo) and write hash for it in our git repo(make sure you are already inside our git repo):
```sh
$ echo "this is a demo file" > ~/Documents/new_file.txt
$ git hash-object ~/Documents/new_file.txt -w
7096a9e4ba600bc862269eff70273f28cba4c56b
```

You'll now notice that inside `.git/objects/70` there will be a file name `96a9e4ba600bc862269eff70273f28cba4c56b` in it.

## git cat-file:

Some important options to use with this low-level git commands:

* **-p**: Contents of the object
* **-s**: Size of the object
* **-t:** Type of the object

`provided hash must exist in the git repository, we'll use our previously created(written) hash`

```sh

$ git cat-file -p 703a16bf2247dc35c60b5c2aa6a8783dc6222b5d
hello, Git
$ git cat-file -s 703a16bf2247dc35c60b5c2aa6a8783dc6222b5d
11
$ git cat-file -t 703a16bf2247dc35c60b5c2aa6a8783dc6222b5d
blob
$ git cat-file -p 7096a9e4ba600bc862269eff70273f28cba4c56b
this is a demo file
$ git cat-file -s 7096a9e4ba600bc862269eff70273f28cba4c56b
20
$ git cat-file -t 7096a9e4ba600bc862269eff70273f28cba4c56b
blob
```

Now, if you delete `~/Documents/new_file.txt` but there will still be blob for that file inside the _.git/objects_ folder. So, git's repository is independent of your file system. The reason that in the first way of creating blobs `echo "hello, Git" | git hash-object --stdin -w`, git doesn't required file name because, git blobs don't have **file names**.

So, git blobs does have names but the name is based on the `sha1` hash of the provided object. So, a conclusion can be the file names of the files that are used to create the git blobs, those filenames aren't actually stored in the blob created by the content of the file(object provided). And commands like `git cat-file` comes handy in such scenerios to recognize the objects. And size and type of object do get stored in the blob crerated by the object provided.

```sh
$ echo "hello, Git" | sha1sum
d7f7912cabd3cbef8d69426fe623c4672de33214  -
$ echo "hello, Git" | git hash-object --stdin
703a16bf2247dc35c60b5c2aa6a8783dc6222b5d
```

You can see that even though git uses `sha1` for hashing they both created different hash and this shows that size and type of objects are stored directly inside the blob. More on that in the next section.


## Contents of Git Objects:


Git objects consists of 4 fields: Object Type, Object Length, Delimiter and Content

```
content     +     Object     +     Object     =     Hash
  |                type            length
  |                 |                 |
  |                 |             +---+
  |                 |             |
  |                 |             
  |                 |    +----------------+
  |                 |--> | blob | 11 | \0 |  <----- Delimiter
  |                      |----------------|
  |--------------------> |   hello, Git   |
                         +----------------+
```

```sh
$ echo "blob 11\0hello, Git" | sha1sum
703a16bf2247dc35c60b5c2aa6a8783dc6222b5d  -
# you can use -e flag for escape char with echo too
$ echo "hello, Git" | git hash-object --stdin
703a16bf2247dc35c60b5c2aa6a8783dc6222b5d
$ echo "blob 20\0this is a demo file" | sha1sum
7096a9e4ba600bc862269eff70273f28cba4c56b  -
$ echo "this is a demo file" | git hash-object --stdin
7096a9e4ba600bc862269eff70273f28cba4c56b
```

Now, you can see that git objects is made up of 4 fields as mentioned above.

## Using git lfs

git lfs (large file storage) uploads and downloads large files lazily. Read more here: [git lfs](https://www.atlassian.com/git/tutorials/git-lfs)

**NOTE:** There's limit of bandwidth, size etc. in git lfs and the service provider for git. You can check [here](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-git-large-file-storage) as example.

A generic approach to use `git lfs` is like this

```sh
$ sudo pacman -S git-lfs  # install git-lfs
$ cd my_repo # go to repository (or create new one with 'git init')
$ git lfs install # setup the lfs (do only once per user account (or repo))
$ git lfs track **/*.png # track the large file/s (use same globbing as .gitignore), it'll create '.gitattributes' file
$ git add .gitattributes  # if you want to add your local .gitattributes globally (recommended most of the time)
$ git commit -m "adding .gitattributes" # only do this if you've staged the file
$ git add **/*.png
$ git commit -m "adding git lfs tracked png files"
$ git push -u origin main
```
