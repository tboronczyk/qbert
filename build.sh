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
# ...

echo "Generating patch..."
$FLIPS -c -i "$ORIG" "$ROM" "$IPS"

echo "Done"
