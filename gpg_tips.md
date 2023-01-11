# GPG

`gpg` is  the OpenPGP part of the GNU Privacy Guard (GnuPG). `man gpg` to find out more.

## Import and Export gpg keys

```sh
# export
$ gpg --list-keys                                   # list all gpg keys installed on the system
$ gpg --export -a $KEY_UID > public.key             # get public key backup
$ gpg --export-secret-key -a $KEY_UID > private.key # get private key backup (which also includes public key)
$ gpg --export-ownertrust > otrust.txt              # useful for backup purposes ('man gpg' to find out more)

# store/share the key in secure way. Use `scp` (or similar secure methods) to share keys

# import
$ gpg --import public.key
$ gpg --import private.key
$ gpg --import-ownertrust otrust.txt
$ gpg --list-keys
```
