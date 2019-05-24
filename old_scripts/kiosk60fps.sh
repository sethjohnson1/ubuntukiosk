#!/bin/bash
# Run this script in display 0 - the monitor
export DISPLAY=:0
#not sure if VNC is messing it up or not..
#x11vnc &
#hides the cursor, which happens automatically on touchscreen for the most part
#unclutter &

#if Chrome crashed, prevent the little nag
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/kiosk/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/kiosk/.config/chromium/Default/Preferences

while true;do
#notice google-chrome is substituted for chromium-browser due to bugs!
chromium-browser %u --user-agent="kioskID001" --kiosk --enable-nacl --show-fps-counter --enable-native-gpu-memory-buffers --enable-gpu-memory-buffer-compositor-resources --enable-gpu-memory-buffer-video-frames --enable-gpu-rasterization --enable-distance-field-text --enable-gpu-async-worker-context --disable-gesture-editing --disable-pinch --disable-infobars --disable-breakpad --overscroll-history-navigation=0 --ignore-certificate-errors --disable-web-security --enable-smooth-scrolling --user-data-dir="/home/kiosk/.config/chromium/" https://iscout.bbcw.org
done
