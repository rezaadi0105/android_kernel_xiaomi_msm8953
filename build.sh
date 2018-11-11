#!/bin/sh


export KBUILD_BUILD_USER=reza-adi-pangestu
export KBUILD_BUILD_HOST=axioo
export ARCH=arm64
export SUBARCH=arm64



export CROSS_COMPILE=/home/reza/skyark/aarch64-linux-android-4.9/bin/aarch64-linux-android-

make clean O=out/
make mrproper O=out/

make mido_defconfig O=out/

make -j8 O=out/

