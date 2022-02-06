# table

## Undoing Changes

| command                                   | statement                                 |
| :----------:                              | :--------:                                |
| git checkout <commit-hash>                | detach head                               |
| git checkout HEAD~<no.>                   | detach head (HEAD reference)              |
| git checkout -                            | move head back to previous position       |
| git checkout <commit\|HEAD~<\no.> <file>  | discard change of a file                  |
| git checkout -- <file>                    | discard change of a file (prev position)  |
