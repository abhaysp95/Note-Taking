# run a macro selectively

## Context:

```
ac_init([x11-example], [1.0])

# safety check in case user overwritten --srcdir
ac_config_srcdir([x11-example.c])

ac_config_aux_dir([build-aux])

am_init_automake([-Wall -Werror foreign])

# check for c compiler
ac_prog_cc

# check for x11
# it exports variable X_CFLAGS and X_LIBS
ac_path_xtra
```

Change the m4 macro of this configure.ac file to upper-case. Normally, running the vim macro `0gUwj` will solve the issue, but just in case, what if you don't want to run this vim macro on lines with comment.


## Solution

### Sol1

`%global/REGEX/norm @q`

**Explaination:** `%global/^[^#]/norm @q` (assuming q is the vim macro with action for `0gUwj`)

### Sol2

`s/\(query1|query2|query3\)/\U\1/g` (just the sed syntax)

