#!/bin/sh

tempdir=$(mktemp -d)

for file do
	pdftoppm -png "$file" "$tempdir/${file%%.*}"
done

open "$tempdir"
