#!/bin/bash

cd ~/etk/LabDemo
./LabDemoWebApp.ASPnetCore &

sleep 5

http://localhost:5000/


# load chromium after boot and point to the localhost webserver in full screen mode
chromium-browser \
    -app=http://localhost:5000/ \
    -start-fullscreen \
    -kiosk \
    –enable-kiosk-mode \
    –enabled \
    -incognito \
    -noerrdialogs \
    -disable-translate \
    -no-first-run \
    -fast \
    -fast-start \
    –touch-events \
    –touch-events-ui \
    –disable-ipv6 \
    —overscroll-history-navigation=0 \
    –allow-file-access-from-files \
    –disable-java \
    –disable-restore-session-state \
    –disable-sync \
    —disable-session-crashed-bubble \
    -disable-infobars \
    -disable-features=TranslateUI \
    –disable-translate \
    —disable-pinch \
    —disable-infobars \
    -disk-cache-dir=/dev/null \
    –disk-cache-size=1 \
    –media-cache-size=1 

# load midori
#midori -e Fullscreen -a http://localhost:5000/

exit 0


    