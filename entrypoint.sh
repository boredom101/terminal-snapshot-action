#!/bin/sh -l

cd /
tar -zxf /mesa.tar.gz
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mesa/local/lib/x86_64-linux-gnu
export GALLIUM_DRIVER=swr

cd $GITHUB_WORKSPACE
mkdir ../xvfb

ROW=$(( 24*$1 ))
COL=$(( 24*$2 ))

Xvfb :99 -fbdir ../xvfb -screen 0 ${1}x${2}x8 &
export DISPLAY=:99

xterm -hold -e $5 &

sleep $4

convert xwd:../xvfb/Xvfb_screen0 png:$3
