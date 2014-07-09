#!/bin/bash

# This script is supposed to do the following jobs:
# a. extract bluetooth stack prebuilt libraries and related tool
# b. copy to project directory
# c. commit to git repo
# d. upload for review

SRC_DIR=`pwd`
DEST_DIR=$1

if [ $# -ne 1 ]; then
	echo "Please specify the dest directory"
	exit 0
fi

echo "copy blueangel binraires from ${SRC_DIR} to ${DEST_DIR}"

echo "extracting so files"
cd ${SRC_DIR}

TAR_FILE=`find . -maxdepth 1 -name "*Hisense_Official_Patch_V*.tar.gz"`
TMP_DATE=`echo $TAR_FILE | cut -d "_" -f1`
TMP_VERSION=`echo $TAR_FILE | cut -d "_" -f5`

RELEASE_DATE=`echo $TMP_DATE | cut -d "/" -f2`
RELEASE_VERSION=`echo $TMP_VERSION | cut -d "." -f1,2,3`

echo $TAR_FILE
echo $RELEASE_DATE
echo $RELEASE_VERSION

tar xvf ${TAR_FILE}

# always sync to git repo
cd ${DEST_DIR}/device/mstar/
repo sync common mstarnapoli


# copy new blueangel libraries and tools
cd ${SRC_DIR}/${RELEASE_DATE}_Hisense_Official_Patch_${RELEASE_VERSION}
cp *.so ${DEST_DIR}/device/mstar/common/libraries/bluetooth/mtk
cp btconfig ${DEST_DIR}/device/mstar/common/preinstall/bluetooth
cp mtkbt ${DEST_DIR}/device/mstar/common/preinstall/bluetooth

# copy bluetooth driver
cp btmtk_usb.ko ${DEST_DIR}/device/mstar/mstarnapoli/preinstall/modules

# commit to git repo
cd ${DEST_DIR}/device/mstar/common
rm ${DEST_DIR}/device/mstar/common/libraries/bluetooth/mtk/libbt-nano.so
git commit -asm "add mtk prebuilt binaries (${RELEASE_VERSION}, date: ${RELEASE_DATE})"

cd ${DEST_DIR}/device/mstar/mstarnapoli
git commit -asm "bluetooth: add new mt7662 module driver"


# upload for code review
cd ${DEST_DIR}/device/mstar/
repo upload common mstarnapoli
