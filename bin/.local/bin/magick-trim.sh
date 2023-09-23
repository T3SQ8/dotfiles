#!/bin/sh

for file do
	out="${file%%.*}.trim.${file#*.}"
	magick convert -fuzz 5% "$file" -trim "$out"
done
