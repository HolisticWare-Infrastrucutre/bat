export EMAIL="author@host.domain.tld"
export USER=`whoami`
echo $USER

ls -al ~/.ssh
cat ~/.ssh/authorized_keys 
ssh-keygen -t rsa -b 4096 -C $EMAIL

#    Generating public/private rsa key pair.
#    Enter file in which to save the key (/Users/$USER/.ssh/id_rsa): 
#    Enter passphrase (empty for no passphrase): 
#    Enter same passphrase again: 
#    Your identification has been saved in /Users/$USER/.ssh/id_rsa.
#    Your public key has been saved in /Users/$USER/.ssh/id_rsa.pub.
#    The key fingerprint is:
#    SHA256: <SHA> <$EMAIL>
#    The key's randomart image is:
+---[RSA 4096]----+
|                 |
|..       . o     |
|E .     . + .    |
|++       +   .   |
|*.o     S . . .. |
|+o       + = + oo|
|o.      = * * o =|
|o o. . + * = +ooo|
| +o.o . + o . .=.|
+----[SHA256]-----+



# $USER - pasprhase was empty!!

eval "$(ssh-agent -s)"
cat ~/.ssh/config

echo \
"
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
 " \
>> ~/.ssh/config

cat ~/.ssh/config

ssh-add -K ~/.ssh/id_rsa

# Mac 2013 OLD
# $USER passphrase = $USER
Enter passphrase for /Users/$USER/.ssh/id_rsa: 
Bad passphrase, try again for /Users/$USER/.ssh/id_rsa: 
Identity added: /Users/$USER/.ssh/id_rsa (/Users/$USER/.ssh/id_rsa)

pbcopy < ~/.ssh/id_rsa.pub

export GITHUB_USER_OR_ORGANIZATION=
export GITHUB_REPO=
git clone git@github.com:$GITHUB_USER_OR_ORGANIZATION/$GITHUB_REPO.git

