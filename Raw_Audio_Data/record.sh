#!/bin/bash

WRITE_DIR="$1"
SOUND_RATE=44100 # Hz
BIT_DEPTH=S16_LE # Signed 16 bit, Little Endian
DURATION=3 # Seconds

FILE_NAME_CNT=$2

echo "Press ENTER for recording"

while read -r ans
do
  if [[ "$ans" == "quit" ]]; then
        break
  fi

  arecord -f $BIT_DEPTH -r $SOUND_RATE -d $DURATION "$WRITE_DIR/$FILE_NAME_CNT.wav"
  echo "Recording Finished!"
  echo "Press ENTER for recording"
  ((FILE_NAME_CNT++))
done