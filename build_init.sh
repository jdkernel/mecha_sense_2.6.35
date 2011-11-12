#!/bin/bash

#Pull config from file.
PACKAGE=$"jdkernel_mecha_sense_v1.02.zip"

cd ~/mecha_sense_2.6.35
rm -rf ~/mecha_sense_2.6.35/AnyKernel/
git clone https://github.com/jdkoreclipse/AnyKernel.git
make clean
make jdkernel_defconfig
make -j8 ARCH=arm CROSS_COMPILE=/home/jdkoreclipse/android/4.4.4/bin/arm-none-eabi-
cp ~/mecha_sense_2.6.35/arch/arm/boot/zImage ~/mecha_sense_2.6.35/AnyKernel/kernel/zImage
cp ~/mecha_sense_2.6.35/drivers/net/wireless/bcm4329_204/bcm4329.ko  ~/mecha_sense_2.6.35/AnyKernel/system/lib/modules/bcm4329.ko
cd AnyKernel 
zip -r $PACKAGE system kernel META-INF 
md5sum $PACKAGE > $PACKAGE.md5sum


exit


