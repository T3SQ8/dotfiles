#!/bin/sh

tempdir=$(mktemp -d)

for file do
	pdfimages -all "$file" "$tempdir/${file%%.*}"
done

open "$tempdir"
