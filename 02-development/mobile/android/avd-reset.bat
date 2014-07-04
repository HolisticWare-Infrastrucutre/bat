::@echo off

set AVD="MonoForAndroid.x86.API-10-v.2.3.3"

rd /s /q %USERPROFILE%\.android\avd\%AVD%.avd\cache.img.lock
rd /s /q %USERPROFILE%\.android\avd\%AVD%.avd\userdata-qemu.img.lock


pause