#/bin/bash

sudo apt-key adv \
    --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo apt-get update

# Common CA certificates are needed for ASF to work
sudo apt-get install -y \
     ca-certificates 
sudo apt-get install -y \
     mono-complete \
     referenceassemblies-pcl \


mono -V

