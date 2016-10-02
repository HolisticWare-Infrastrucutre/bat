

http://preshing.com/20141119/how-to-build-a-gcc-cross-compiler/
https://gist.github.com/preshing/41d5c7248dea16238b60

https://github.com/dotnet/coreclr/blob/master/Documentation/building/cross-building.md

https://github.com/dotnet/corert/blob/master/Documentation/cross-building.md

https://github.com/dotnet/corefx/blob/master/Documentation/building/cross-building.md


	sudo apt-get install -y \
		cmake \
		qemu \
		qemu-user-static \
		binfmt-support \
		debootstrap
		

	sudo apt-get install -y \
		binutils-arm-linux-gnueabihf \
		binutils-aarch64-linux-gnu \
		
	git clone --recursive \
        https://github.com/dotnet/corert.git
	git clone --recursive \
        https://github.com/dotnet/coreclr.git
	git clone --recursive \
        https://github.com/dotnet/corefx.git

		
	sudo ./coreclr/cross/build-rootfs.sh arm 
	ls -al ./coreclr/cross/rootfs/arm/
	./coreclr/build.sh arm debug verbose clean cross
	
	sudo ./coreclr/cross/build-rootfs.sh arm64
	ls -al ./coreclr/rootfs/arm64/
	./build.sh arm debug verbose clean cross
	