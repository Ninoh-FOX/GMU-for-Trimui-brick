#!/bin/sh

gmudir="/mnt/SDCARD/Apps/gmu"
SDCARD_BIN="/mnt/SDCARD/trimui/bin"
SDCARD_LIB="/mnt/SDCARD/trimui/lib"
TRIMUI_BIN="/usr/trimui/bin"
TRIMUI_LIB="/usr/trimui/lib"

export HOME="$gmudir"

if [ -d $SDCARD_BIN ]; then
export PATH="/tmp/sbin:$SDCARD_BIN:$TRIMUI_BIN:/usr/sbin:/usr/bin:/sbin:/bin"
else
export PATH="/tmp/sbin:$TRIMUI_BIN:/usr/sbin:/usr/bin:/sbin:/bin"
fi

if [ -d $SDCARD_LIB ]; then
export LD_LIBRARY_PATH="$SDCARD_LIB:$TRIMUI_LIB:/urs/lib:/lib"
else
export LD_LIBRARY_PATH="$TRIMUI_LIB:/urs/lib:/lib"
fi

export LD_LIBRARY_PATH="$gmudir/libs:$LD_LIBRARY_PATH"
cd "$gmudir"
./gptokeyb "gmu.bin" -c "$gmudir/gmu.gptk" &
./gmu.bin -c gmu.settings.conf > log.txt 2>&1
killall -9 gptokeyb
sync
