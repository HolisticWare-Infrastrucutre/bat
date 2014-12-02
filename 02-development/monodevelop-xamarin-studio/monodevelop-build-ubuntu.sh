sudo apt-get install \
	git mono-mcs mono-gmcs \
	autoconf libtool g++ libglib2.0-cil-dev \
	libgtk2.0-cil-dev libglade2.0-cil-dev \
	libgnome2.0-cil-dev libgconf2.0-cil-dev

mkdir mono
cd mono
git clone https://github.com/mono/mono.git
git clone https://github.com/mono/monodevelop.git
git clone https://github.com/mono/xsp.git
git clone https://github.com/mono/mono-addins.git
cd mono
./autogen.sh --prefix=/usr && make && sudo make install
cd ../mono-addins
./autogen.sh --prefix=/usr && make && sudo make install
cd ../xsp
./autogen.sh --prefix=/usr && make && sudo make install
cd ../monodevelop
./configure --prefix=/usr && make && sudo make install