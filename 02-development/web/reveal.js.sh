#!/bin/bash


git clone https://github.com/hakimel/reveal.js.git
git clone https://github.com/moljac/HolisticWare.Talks.git

mkdir reveal.js/case2019/
cp -r HolisticWare.Talks/2019-02/case2019/ reveal.js/case2019/
cd reveal.js
npm install
npm start