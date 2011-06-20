#!/bin/sh
# Display ASF video stream and store it on desktop
# Give URL of stream as script argument
# Every time script is running it creates new file with increased number

PREFIX=~/Plocha/tv
NUM=1
POSTFIX=.asf

while [ -f $PREFIX$NUM$POSTFIX ]
    do let NUM+=1
done

vlc "$1" --sout "#duplicate{dst=display,dst=std{access=file,mux=asf,dst=$PREFIX$NUM$POSTFIX}}"
