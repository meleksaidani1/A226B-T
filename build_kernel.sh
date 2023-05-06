#!/bin/bash

make clean && make mrproper
export PATH="$HOME/toolchains/prebuilts/clang/host/linux-x86/clang-r450784e/bin/:$PATH"
# export CROSS_COMPILE=$(pwd)/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-
export CROSS_COMPILE=/home/grahame/toolchains/aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-
${CROSS_COMPILE}ld -v
export CC=$(pwd)/toolchain/clang13-main/bin/clang


export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=t

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y physwizz_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j16

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image


