#!/bin/bash

# ===============================================================
# web apps need icons of various sizes for different platforms
#
# find an original and use this script to create a pile of icons
# ===============================================================

#16x16, 24x24, 30x30, 32x32, 42x42,  44x44, 48x48, 54x54, 62x62, 64x64, 71x71, 90x90, 99x99, 106x106, 128x128, 150x150, 170x170, 210x210, 256x256, 360x360 icons
# apple icon.png 57x57; icon@2x.png 114x114
#                120x120, 180x80, 152x152, 167x167, App Store 1024x1024
#16x16 32x32 favicon
#*black and white* badge 24x24, 48x48

original="dandelion.jpg"

convert $original -resize 16x16! icon16.png
convert $original -resize 24x24! icon24.png
convert $original -resize 30x30! icon30.png
convert $original -resize 32x32! icon32.png
convert $original -resize 42x42! icon42.png
convert $original -resize 44x44! icon44.png
convert $original -resize 48x48! icon48.png
convert $original -resize 54x54! icon54.png
convert $original -resize 62x62! icon62.png
convert $original -resize 64x64! icon64.png
convert $original -resize 65x65! icon65.png
convert $original -resize 70x70! icon70.png
convert $original -resize 71x71! icon71.png
convert $original -resize 72x72! icon72.png
convert $original -resize 76x76! icon76.png
convert $original -resize 90x90! icon90.png
convert $original -resize 96x96! icon96.png
convert $original -resize 99x99! icon99.png
convert $original -resize 106x106! icon106.png
convert $original -resize 120x120! icon120.png
convert $original -resize 128x128! icon128.png
convert $original -resize 144x144! icon144.png
convert $original -resize 150x150! icon150.png
convert $original -resize 152x152! icon152.png
convert $original -resize 167x167! icon167.png
convert $original -resize 170x170! icon170.png
convert $original -resize 180x180! icon180.png
convert $original -resize 192x192! icon192.png
convert $original -resize 210x210! icon210.png
convert $original -resize 256x256! icon256.png
convert $original -resize 270x270! icon270.png
convert $original -resize 360x360! icon360.png
convert $original -resize 512x512! icon512.png
convert $original -resize 1024x1024! icon1024.png

convert $original -resize 57x57! icon.png
convert $original -resize 114x114! icon@2x.png

convert $original -resize 16x16!   -gravity center -crop 16x16+0+0   -flatten -colors 256 -background transparent favicon16.ico
convert $original -resize 32x32!   -gravity center -crop 32x32+0+0   -flatten -colors 256 -background transparent favicon32.ico
convert $original -resize 128x128! -gravity center -crop 128x128+0+0 -flatten -colors 256 -background transparent favicon.ico

convert $original -monochrome -resize 24x24! icon24bw.png
convert $original -monochrome -resize 48x48! icon48bw.png

