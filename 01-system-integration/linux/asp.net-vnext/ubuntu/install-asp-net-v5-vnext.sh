#!/bin/bash



curl \
	https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh \
	| \
	sh \
	&& \
	source ~/.kre/kvm/kvm.sh

#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                 Dload  Upload   Total   Spent    Left  Speed
# 100  2475  100  2475    0     0   2945      0 --:--:-- --:--:-- --:--:--  2946
# Downloading kvm as script to '/home/jana/.kre/kvm'
# 
# Appending source string to /home/jana/.bashrc
# Type 'source /home/jana/.kre/kvm/kvm.sh' to start using kvm


cat \
	source /home/jana/.kre/kvm/kvm.sh


git clone https://github.com/aspnet/Home.git
cd Home/

k kestrel