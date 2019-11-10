sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update
sudo apt install flatpak
flatpak
flatpak remote-add --from gnome https://sdk.gnome.org/gnome.flatpakrepo
flatpak install gnome org.freedesktop.Platform 1.4
flatpak install --user --bundle xs.flatpak
cd Downloads/
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
wget https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_
64.zip

sudo apt install -y \
	cpu-checker

sudo kvm-ok


sudo apt install java
sudo apt install jdk
apt-get install lib64stdc++6:i386
sudo apt-get install lib64stdc++6:i386

sudo apt autoremove

sudo apt-get install -y \
	gtk-sharp2 \
	cmake \
	libssh2-1 \
	libssh2-1-dev \
	mono-devel mono-xbuild mono-mcs
	ibmono-addins-msbuild-cil-dev


msbuild_packageid="Microsoft.Build.Mono.Debug"
msbuild_version="14.1.0.0-prerelease" # update as needed

mono $HOME/nuget.exe install $msbuild_packageid \
	-Version $msbuild_version \
	-Source "https://www.myget.org/F/dotnet-buildtools/"

# run MSBuild
mono $packageid.$version/lib/MSBuild.exe
