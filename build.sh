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
dd if=chr/press-start.bin of="$ROM" conv=notrunc bs=1 seek=$((0xAE00))
dd if=chr/end-finale.bin of="$ROM" conv=notrunc bs=1 seek=$((0xE160))
dd if=chr/end-congratulations.bin of="$ROM" conv=notrunc bs=1 seek=$((0xE4E0))
dd if=chr/end-dankon-d.bin of="$ROM" conv=notrunc bs=1 seek=$((0xE550))
dd if=chr/player-rainbow1-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0x81F0))
dd if=chr/player-rainbow1-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0xA1F0))
dd if=chr/player-rainbow1-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8230))
dd if=chr/player-rainbow1-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0xA230))
dd if=chr/player-rainbow1-3.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8610))
dd if=chr/player-rainbow1-3.bin of="$ROM" conv=notrunc bs=1 seek=$((0xA610))
dd if=chr/player-rainbow1-4.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8EE0))
dd if=chr/player-rainbow1-4.bin of="$ROM" conv=notrunc bs=1 seek=$((0xAEE0))
dd if=chr/player-rainbow2-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8250))
dd if=chr/player-rainbow2-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0xA250))
dd if=chr/player-rainbow2-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8CE0))
dd if=chr/player-rainbow2-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0xACE0))
dd if=chr/player-rainbow2-3.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8EF0))
dd if=chr/player-rainbow2-3.bin of="$ROM" conv=notrunc bs=1 seek=$((0xAEF0))
dd if=chr/player-rainbow3-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0x82B0))
dd if=chr/player-rainbow3-1.bin of="$ROM" conv=notrunc bs=1 seek=$((0xA2B0))
dd if=chr/player-rainbow3-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x82E0))
dd if=chr/player-rainbow3-2.bin of="$ROM" conv=notrunc bs=1 seek=$((0xA2E0))
dd if=chr/player-rainbow3-3.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8300))
dd if=chr/player-rainbow3-3.bin of="$ROM" conv=notrunc bs=1 seek=$((0xA300))
dd if=chr/player-rainbow3-4.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8CC0))
dd if=chr/player-rainbow3-4.bin of="$ROM" conv=notrunc bs=1 seek=$((0xACC0))
dd if=chr/player-rainbow3-5.bin of="$ROM" conv=notrunc bs=1 seek=$((0x8F00))
dd if=chr/player-rainbow3-5.bin of="$ROM" conv=notrunc bs=1 seek=$((0xAF00))

echo "Generating patch..."
$FLIPS -c -i "$ORIG" "$ROM" "$IPS"

echo "Done"
