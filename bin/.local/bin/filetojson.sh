#!/bin/sh

sed 's/\$/\\\\$/g;s/^\t/\\t/;s/^/"/;s/$/",/' "$1"