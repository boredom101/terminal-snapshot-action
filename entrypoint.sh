#!/bin/sh -l

cd $GITHUB_WORKSPACE
mkdir ../xvfb

ROW=$(( 24*$1 ))
COL=$(( 24*$2 ))

Xvfb :99 -fbdir ../xvfb -screen 0 ${ROW}x${COL}x8 &
export DISPLAY=:99

xhost +

xterm -hold -e $5 &

sleep $4

convert xwd:../xvfb/Xvfb_screen0 png:$3
