

mas upgrade


# list available updates
softwareupdate -l 

# softwareupdate -i <name of update from the above command> to install one specific update

# install all available updates
softwareupdate -i -a 


# https://github.com/imwally/scripts/blob/master/whatsnew

# https://gist.github.com/mayel/c07bc0acb91824501d5bdbdc9eb7b33a


function software_updates()
{
    brew update; brew upgrade; brew cleanup; 
    # sudo -H pip3 freeze --local | grep -v '-e' | cut -d = -f 1 | sudo -H xargs -n1 pip3 install -U; 
    sudo softwareupdate -iai
    mas upgrade
}

# https://www.reddit.com/r/apple/comments/6obcur/lpt_update_your_mac_with_the_softwareupdate/

#!/bin/bash
# pip3.13 install --upgrade pip
# pip3.13 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3.13 install -U
# pip3 install --upgrade pip3
# pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
# brew update && brew upgrade
# curl -s https://gist.githubusercontent.com/atais/9c72e469b1cbec35c7c430ce03de2a6b/raw/36808a0544628398f26b48f7a3c7b309872ca2c6/cask_upgrade.sh | bash /dev/stdin

# mas upgrade
# 
# yes | apm update
# 
# pip2 freeze > ~/Dropbox/system_settings/pip_requirements.txt
# pip3 freeze > ~/Dropbox/system_settings/pip3_requirements.txt
# brew bundle dump -force --file=~/Dropbox/system_settings/Brewfile
# cat ~/.bash_profile > ~/Dropbox/system_settings/bash_profile.txt


# https://github.com/mas-cli/mas

# brew install mas


xcode-select --install
