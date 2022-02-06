# table

## Undoing Changes

| command                                          | statement                                                                                             |
| :----------:                                     | :--------:                                                                                            |
| git checkout <commit-hash>                       | detach head                                                                                           |
| git checkout HEAD~<no.>                          | detach head (HEAD reference)                                                                          |
| git checkout -                                   | move head back to previous position                                                                   |
| git checkout <commit\|HEAD~<no.> <file>          | discard change of a file                                                                              |
| git checkout -- <file>                           | discard change of a file (prev position)                                                              |
| git restore <file>                               | unmodify file/restore back to HEAD (non-undoable uncommited changes)                                  |
| git restore --source <commit\|HEAD~<no.> <file>  | unmodify file/restore back to specified desitnation for given file (non-undoable uncommited changes)  |
| git restore --staged <file>                      | unstage file/revert back staged changes (not committed yet, changes will not be deleted)              |
