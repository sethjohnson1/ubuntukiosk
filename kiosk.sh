#!/bin/bash
#export DISPLAY=:0
#openbox-session &
xset s off -dpms
#start-pulseaudio-x11
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/kiosk/.config/google-chrome/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/kiosk/.config/google-chrome/Default/Preferences
while true; do
  #rm -rf ~/.{config,cache}/google-chrome/
  google-chrome %u --kiosk --window-position=0,0 --window-size=1920,1080 --no-first-run --start-fullscreen --enable-native-gpu-memory-buffers --enable-gpu-memory-buffer-compositor-resources --enable-gpu-async-worker-context --enable-gpu-memory-buffer-video-frames --enable-gpu-rasterization --enable-distance-field-text --disable-gesture-editing --disable-pinch --disable-infobars --disable-breakpad --overscroll-history-navigation=0 --ignore-certificate-errors --disable-web-security --reduce-security-for-testing --enable-smooth-scrolling --user-data-dir="/home/kiosk/.config/google-chrome" --force-gpu-rasterization --user-agent="kioskID006" https://iscout.bbcw.org
done
#USE THESE FOR FABRIC.js touch events and webcam support: --touch-events --use-fake-ui-for-media-stream
#--disable-threaded-scrolling --disable-accelerated-2d-canvas 
#--disable-accelerated-jpeg-decoding --disable-gpu-sandbox
