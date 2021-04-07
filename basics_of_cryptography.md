# modes of cryptography

## secret key or symmetric single key

* Uses single key
* Used by both sender(to encrypt) and reciever(to decrypt)
* If this key is compromised, so is the communication(message)

## asymmetric or public/private key

* Uses key pair: public & private
* These keys are mathematically related
* One is used to encrypt(private) and other is used to decrypt(public)
* Share the public key with others
* private key is also used for digital signatures as well

**Example:** Let's take an example of asymmetric encryption

You want to encrypt a message and you have keys in keyring of different people from whom you communicate say B, C, D(you're A). Now, to send encrypted message to say C, you'll use C's public key with an encryption algorithm(RSA for example) and you'll send this encrypted message to C, now only C can decypher this message with private key of his(since you used his public key to encrypt message).

## Using GnuPG(GPG)

* Open source public/private key software
* It implements symmetric as well as public/private(asymmetric) encryption system
	- Actually public/private uses hybrid system of symmetric/asymmetric
* Can use for encrypting and decrypting
* Create digital signatures for signing and authentication

### Generatring key(GPG)

```sh
$ gpg --full-generate-key  # there's also gpg --gen-key
```

It'll ask you to select which type of key you want(encryption), then it'll ask for keysize(in bits), then it'll ask for validity of the key(it's for both public and private, since it's a pair), then it'll ask for `user ID`(fill in the details it asked, if you don't have any reason of not to). After that, it'll ask for passphrase. This passphrase is to protect your private key. You'll be shown unique identifier of your public key(and private key to some lines below)(which will be marked as ultimately trusted), and if someone wants to download public key from server, he can use your email address or unique combination of those hexadecimal digits as unique identifier. It later tells all the details of what the gpg has done and the process is now complete.

You'll see the `Key fingerprint = <some hex values>`. The key fingerprint is the shorthand signature for your key. It allows you to confirm to others that they have recieved your actual public key without any tampering. You don't need to write this fingerprint down. To display the fingerprint at any time, use the command:

```sh
$ gpg --fingerprint somewhere@someemail.com
```

You can get your gpg key ID with the fingerprint you obtained, it depends on the length of the key size you chose while generating the key-pair. Like for 2048 len(bits) key-pair, you key ID may contain last 8 hex digits of the fingerprint.

**Warning:** you should read the warning section from `man gpg`. An important portion of that section is below:

```
Use a good password for your user account and make sure that all security
issues are always fixed on  your  machine.   Also employ diligent physical
protection to your machine.  Consider to use a good passphrase as a last resort
protection to your secret key in the case your machine gets stolen.  It is
important that your secret key is never leaked.  Using an  easy  to carry
around token or smartcard with the secret key is often a advisable.
```

### Generating revocation certificate

If your private key is compromised(or lost), you can generate a revocation certificate. This block below is taken from `man gpg`

```
To actually revoke a key the created revocation certificate needs to be merged
with  the  key  to  revoke. This  is  done by importing the revocation
certificate using the --import command.  Then the revoked key needs to be
published, which is best done by sending the key to a keyserver (command
--send-key) and by exporting (--export)  it to a file which is then send to
frequent communication partners.
```

you can revoke key using `--gen-revoke <name>` flag(options). In `name` you have to provide unique-identifier(which can either be that unique hexadecimal identifier which was show when you generated the key-pair or you can use the email of that key pair).

```sh
$ gpg --gen-revoke someemail@somewhere.com
```

If `unique identifier` is correct, it'll find the key in `secret keyring` of ours and will ask for permission to create revocation certificate. It'll then ask for reasons of revocation and then description(which is optional), then it'll ask for the secret passphrase through which you had secured your private key and after successfully entering passphrase your revocation certificate will be generated. The next block is taken from the end of this revocation key generation process from gpg:
```
Please move it to a medium which you can hide away; if Mallory gets
access to this certificate he can use it to make your key unusable.
It is smart to print this certificate and store it away, just in case
your media become unreadable.  But have some caution:  The print system of
your machine might store the data and make it available to others!
```

**Note:** This will print the revocation certificate to STDOUT, you may just redirect the STDOUT to store somewhere else(some file).

## Exporting your public key

In order for others to share the encrypted data to you, or to see the data you encrypted(to whom you want), they need to have your public key. So, you'll have to export your public key. This can be done using `--export` option

By default, the `--export` will create the _binary OpenPGP format_ file. If you'll not provide any _unique identifier_(atleast one), it'll export all the keys in the all keyrings(for more detail, see `--export` section of _man gpg_). By default, the exported key/s will be printed to STDOUT if not provided any file with `--output` option(or redirected).

To generate a `text-encoded file` for the key you are exporting, use `--armor` option with `--export` option and it'll generate ASCII armored output

You can check filetype for both ways using `file` command and you can check the content of the `binary file`(generated just with --export option) using `xxd` command(which converts binary to hex dump or reverse(can also represent data in ASCII)), like if you're using `vim` and have opened the binary file, just get to the command mode and type command `!xxd %` to see the hex dump. You may notice your `user name, comment and email` which you provided while generating key, there.

```sh
$ gpg --output someemail.pubkey.gpg --export someemail@somewhere.com  # note: order of the options matter
# or
$ gpg --output someemail.pubkey.asc --armor --export someemail@somewhere.com
```

## Publishing the public key

You can just as well share your **public key**(_never share the private key_) as an email attachment etc. In order to upload the key to keyserver(specified in your configuration file). There's `--keyserver` option but as of present `man gpg` tells that it's deprecated.

```sh
$ gpg --send-key <uid>
```

Put the fingerprint of your public key in your e-mail signature or your buisness cards etc. This will help the people who downloaded the your key from key server that it's actually your key(and it had not been tampered).
