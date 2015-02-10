#!/bin/bash

rm -fr Home/
git clone https://github.com/aspnet/Home.git

cd Home/

git submodule add https://github.com/moljac/Nowin.vNext.git ./submodulez/Nowin.vNext

