# GDB - The GNU Debugger


## GDB Logging
See: [git & Linux cmds, help, tips & tricks - Gabriel.txt](https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/blob/master/git%20%26%20Linux%20cmds%2C%20help%2C%20tips%20%26%20tricks%20-%20Gabriel.txt)

```gdb
gdb> show logging                 # get the logging details
gdb> set logging file <file_name> # use this if you want to change default logging file name
gdb> set logging on               # turn on the logging
gdb> set trace-commands on        # echo (and log if logging is on) the command itself too
gdb> flush
gdb> set print pretty on
gdb> bt # backtrace
gdb> set logging off
```

## core dump (& coredumpctl)

Many times when facing `segmentation fault`, `core dump` message, it's necessary to go through the actual cause of it. For example, here's how a message can look like:

```
terminate called after throwing an instance of 'std::out_of_range'
  what():  basic_string::substr: __pos (which is 109) > this->size() (which is 29)
zsh: IOT instruction (core dumped)  ./a.out < input.txt
```

**NOTE:** the elf file must have debug symbols, ie., the program should be compiled with debug flag/s


Following are the ways to debug this instance:

### use gdb itself (without any core dump file)

Several times, this is sufficient.

* compile the program with debug symbols
* load the program in gdb
* run the program
* Now, you have got the stacktrace for the fault
* Use commands like `backtrace` (or `bt`), `frame <no.>` to navigate the trace

### get the dump file (without coredumpctl)

```sh
$ ulimit -c                         # get the current size limit
$ ulimit -c unlimited               # change the limit
$ cat /proc/sys/kernel/core_pattern # check the pattern, if you want to change follow below step
$ echo "./my_core.dump"             # will generate a file "my_core.dump" in the pwd of the program ran (or you can get the file from the output place of above command)
$ gdb a.out my_core.dump            # load the dump file with related executable (compiled with debug flag)
```

### get the dump file (use coredumpctl)

If you don't want to change the settings mentioned in the above case, but want the dump file, you can also use `coredumpctl`

```sh
$ coredumpctl dump -o my_core.dump  # will output the core dump to mentioned output file
$ gdb a.out my_core.dump            # load the dump file with related executable (compiled with debug flag)
```

## backtracing (& backtracking)

One you've got the stacktrace (by any of the means above/or maybe by some other means (in that case, please mention it)), follow these steps for backtracing through stacktrace

```gdb
gdb> help backtrace # will give you help for backtrace command
gdb> bt             # backtrace (short-form: bt), gives you the all the stacks in context of core dumped
gdb> frame <no.>    # go to any of the frames mentioned by backtrace

# in case you want to move out to another frame, just give the 'frame <no.>' command. To get the frame no. again, use 'bt' command
```

## Tips & Tricks

### move back to the topmost stack

```gdb
gdb> up 99999 # use a big number to move back
              # or
gdb> bt -20   # give a negative number with backtrace to move up
```


## Commands

| **Command**        | **Description**                                                        |
| :---:              | :---:                                                                  |
| b/break            | set the breakpoint (help breakpoint)                                   |
| c/continue         | continue program after signal or breakpoint                            |
| layout <subcommnd> | change the layout (help layout, for different types of layout)         |
| refresh            | refresh the terminal display (helpful with layout, because it's a tui) |
| s/step             | step program until it reaches different source line                    |
| p/print <arg>      | print value of expression (see, help print for more detail)            |
