# -----------------------------------------------------------------------------------
# ASP.net
#		vNext
#			2014-06-25
# -----------------------------------------------------------------------------------



# -----------------------------------------------------------------------------------
PREFIX_MONO=/usr/local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX_MONO/lib/

cd /tmp/ASP.net.vNext.davidfowl.HelloWorldVNext/src/
cd helloworldweb/
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
kpm restore
# kpm restore -s https://www.myget.org/F/aspnetvnext/
# kpm restore -s https://nugetgallery.blob.core.windows.net
# kpm restore -s https://nuget.org
# kpm restore -s https://go.microsoft.com
# -----------------------------------------------------------------------------------



# -----------------------------------------------------------------------------------
# on Windows or
# SET KRE_TRACE=1 
# on OSX/Linux
export KRE_TRACE=1 
/sbin/ifconfig ; k web2
# -----------------------------------------------------------------------------------
