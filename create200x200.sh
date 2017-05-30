#!/bin/bash
rename 's/\.JPG$/\.jpg/' *.JPG
rename 's/\.JPEG$/\.jpg/' *.JPEG
rename 's/\.jpeg$/\.jpg/' *.jpeg

for f in *.jpg
do
# make jpg files lowercase
# ------------------------
ff=$(echo "$f" | tr '[:upper:]' '[:lower:]')
if [ ! -f $ff ]; then
    mv $f $ff
fi
echo $ff
convert $ff -resize 200x200! ../imgs200x200/$ff
echo "."
done

