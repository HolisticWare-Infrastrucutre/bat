::echo off

call .\android-environment.bat

android list sdk -a
android update sdk -a -u 
