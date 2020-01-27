#!/bin/bash
# Get trim box w, h, x, y
IFS=" x+" read w h x y < <(convert -fuzz 10% start.jpg -format "%@" info:)

# Get longest side
longest=$w
[ $h -gt $longest ] && longest=$h

# Increase by 20%
longest=$(echo "scale=0;$longest*1.2/1" | bc)
echo $longest

convert -fuzz 10% start.jpg -trim -background white -gravity center -extent ${longest}x${longest} result.jpg
