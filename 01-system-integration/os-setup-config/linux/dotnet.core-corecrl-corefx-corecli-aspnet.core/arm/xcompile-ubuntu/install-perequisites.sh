

http://preshing.com/20141119/how-to-build-a-gcc-cross-compiler/
https://gist.github.com/preshing/41d5c7248dea16238b60

https://github.com/dotnet/coreclr/blob/master/Documentation/building/cross-building.md

https://github.com/dotnet/corert/blob/master/Documentation/cross-building.md
https://github.com/dotnet/corert/issues?utf8=%E2%9C%93&q=is%3Aissue%20is%3Aopen%20arm

https://github.com/dotnet/corefx/blob/master/Documentation/building/cross-building.md


	sudo apt-get install -y \
		llvm \
		cmake \
		qemu \
		qemu-user-static \
		binfmt-support \
		debootstrap
		

	sudo apt-get install -y \
		binutils-arm-linux-gnueabihf \
		binutils-aarch64-linux-gnu \
		
    mkdir dotnet/
    cd dotnet/
	
	git clone --recursive \
        https://github.com/dotnet/corert.git
	git clone --recursive \
        https://github.com/dotnet/coreclr.git
	git clone --recursive \
        https://github.com/dotnet/corefx.git

	export MODULE=coreclr
	export ARCHITECTURE=arm
	sudo ./$MODULE/cross/build-rootfs.sh $ARCHITECTURE 
	ls -al ./$MODULE/cross/rootfs/$ARCHITECTURE/
	./$MODULE/build.sh $ARCHITECTURE debug verbose clean cross
	#to generate the rootfs elsewhere:
	#sudo ROOTFS_DIR=~/$MODULE-cross/$ARCHITECTURE ./$MODULE/cross/build-rootfs.sh $ARCHITECTURE
	# ROOTFS_DIR=~/$MODULE-cross/$ARCHITECTURE ./$MODULE/build.sh $ARCHITECTURE debug verbose clean cross
	
	export ARCHITECTURE=arm64
	sudo ./$MODULE/cross/build-rootfs.sh $ARCHITECTURE
	ls -al ./$MODULE/rootfs/$ARCHITECTURE/
	./$MODULE/build.sh $ARCHITECTURE debug verbose clean cross
	
	export MODULE=corert
	export ARCHITECTURE=arm
	sudo ./$MODULE/cross/build-rootfs.sh arm 
	ls -al ./$MODULE/cross/rootfs/arm/
	./$MODULE/build.sh arm debug verbose clean cross
	
	export MODULE=corefx
	export ARCHITECTURE=arm
	sudo ./$MODULE/cross/build-rootfs.sh arm 
	ls -al ./$MODULE/cross/rootfs/arm/
	./$MODULE/build.sh arm debug verbose clean cross
	