echo ================================================
echo creating users

set user=korjenko

:: no password??
net user %user% /add

:: prompting for password
::net user %user% * /add

:: defining password riz.drm
::net user %user% riz.drm /add

:: add user to group
net localgroup Administrators %user% /add

:: makes sure that the account password doesn't expire
:: after 14 days (This is a system-wide setting)

net accounts /maxpwage:unlimited
REGEDIT /S autologon.reg
EXIT

:: to create a user name that has spacing should surround 
:: them with quotes
::
::net user "John Doe" asdf1234 /add
