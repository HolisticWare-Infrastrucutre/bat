 MacPorts Installer addition on 2013-10-15_at_10:40:03: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin/

# mc++ 
export PATH=$PATH:/usr/local/bin/:$HOME/bin/:$HOME/bin/eclipse:$HOME/bin/gradle-2.4

[ -s "/Users/moljac/.kre/kvm/kvm.sh" ] && . "/Users/moljac/.kre/kvm/kvm.sh" # Load kvm

[ -s "/Users/moljac/.dnx/dnvm/dnvm.sh" ] && . "/Users/moljac/.dnx/dnvm/dnvm.sh" # Load dnvm




function setjdk() 
{
	if [ $# -ne 0 ]; 
	then
		removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
		if [ -n "${JAVA_HOME+x}" ]; 
			then
			removeFromPath $JAVA_HOME
		fi
		export JAVA_HOME=`/usr/libexec/java_home -v $@`
		export PATH=$JAVA_HOME/bin:$PATH
	fi
}

function removeFromPath() 
{
	export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

function updatedb() 
{
	sudo /usr/libexec/locate.updatedb
}
 
 