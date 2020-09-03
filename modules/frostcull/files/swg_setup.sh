#!/bin/bash

mkdir -p /etc/swgemu
cd /etc/swgemu
git clone http://review.swgemu.com/Core3
cd Core3/MMOCoreORB/
# YOU NEED TO DO THIS NEXT STEP BEFORE MAKE
cd ..
git submodule update --init --recursive

make -j8



