## Makefile


Here's written some notes on `gnu make` and how to use it

### basic:

```
target: pre-requisite
	rules
```

When invoke make on makefile, it always executes the first target it finds.

```
default: hello
```

Target _default_ has pre-requisite _hello_, it'll look for _hello_ and try to build that inorder to build _default_, which we are trying to build.

We could write target for makefile for _hello_.

```
hello: hello.c
	gcc hello.c -o hello
```

If target is the file-name and it doesn't have any pre-requisite, target will be built regardless of pre-requisite actually.

If the file or any of the file in the pre-requisite list or the files in pre-requisite list or any of the target(can nest target) have been changed(since last called _make_) then target will rebuilt.

When your target is the _name_ of the file which exists in the directory and pre-requisite is _name_.c, `make` already knows than how to compile(gcc hello.c -o hello). This is _implicit target_.

For _implicit target_ if pre-requisite include a object file then implicit target compilation will automatic include object file, how it is done is show below:

```
hello: hello.c func.o
	CC hello.c func.o -o hello
```

We'll also look for pre-requisite for `func.o`
```
hello: hello.c func.o
	CC hello.c func.o -o hello
func.o: func.c
	CC -c func.c
```

	-c will create an object file

Now, this is implcit as, whenever there is target like _name_.o and there exist file in the directory _name_.c, then implicit compilation is done with `-c` flag.

`Note: you can use make with -f flag to specify makefile`


### Automatic variables

```
obj=a.o b.o c.o d.o

target: target.c $(obj)
	clang $^ -o $@
```

* **$^**: it is replaced with pre-requisite
* **$@**: it is the name of the target

### Implicit pattern rule

```
default: hello a.o

%: %.c
	cc $^ -o $@

%.o: %.c
	cc -c $^ -o $@
```

Here, % will be replaced by the pre-requisite of default _hello_ and will be used as _target_, same for _object file_ a.o will be used for _%.o_ and it can also work implictitly if the target is found in directory or it'll look the prerequisite now and run according the rule.

Another example can be,

```
default: x.txt.end

%.txt.end: %.txt
	cat $^ | tail -n 20 > $@
```

Now, `x.txt.end` will look for it's target, and then this will check for `%.txt`, and then it'll create the file for `%.txt.end`.

This also means that `Makefile` aren't necessary for only C & C related file, it can perform any `GNU` related operation I think.
