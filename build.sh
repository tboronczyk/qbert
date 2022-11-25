#! /bin/bash

set -e

ORIG="Q-Bert (USA).nes"
ROM="qbert-eo.nes"
IPS="qbert-eo.ips"
FLIPS="wine /opt/floating/flips.exe"

echo "Assembling ROM..."
cd src
/opt/asm6f/asm6f Q-Bert.asm qbert.nes
cp qbert.nes ../$ROM
cd ..

echo "Updating CHR..."
dd if=chr/alphabet-eo.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8F10))
dd if=chr/alphabet-eo.bin of="$ROM" conv=notrunc bs=1 seek=$((0xAF10))
dd if=chr/alphabet-eo.bin of="$ROM" conv=notrunc bs=1 seek=$((0xCF10))
dd if=chr/alphabet-eo.bin of="$ROM" conv=notrunc bs=1 seek=$((0xCF60))
dd if=chr/alphabet-eo-bg.bin of="$ROM" conv=notrunc bs=1 seek=$((0xCF10))
dd if=chr/level.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8D80))

echo "Generating patch..."
$FLIPS -c -i "$ORIG" "$ROM" "$IPS"

echo "Done"
