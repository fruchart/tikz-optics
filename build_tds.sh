#!/bin/bash    
# Script to create a TDS-structured package for the tikz-optics library.
# See https://www.ctan.org/TDS-guidelines for the TDS structure.
#
# This script is part of the tikz-optics library and is subject to
# the same licenses: it can be distributed and/or modified under the 
# LLPL 1.3c or the GNU GPL 2 (or later).

# create a temporary directory (to put the contents of the zip file to be)
# and register a cleanup function to remove it at EXIT
readonly tmpdir=$(mktemp -d)
function cleanup {
  rm -r "$tmpdir"
}
trap cleanup EXIT

# create the required TDS structure and put our files in it
docdir="$tmpdir/doc/latex/tikz-optics/"
texdir="$tmpdir/tex/latex/tikz-optics/"
mkdir -p "$docdir"
mkdir -p "$texdir"
cp doc/tikz-optics.pdf -t "$docdir"
cp tikzlibraryoptics.code.tex -t "$texdir"

# zip the contents into the wanted TDS package
outfile="tikz-optics.tds.zip"
if [ -e outfile ]; then
	rm "$outfile"
fi;
pushd "$tmpdir" > /dev/null
zip -qr "$outfile" ./
popd > /dev/null
mv "$tmpdir/$outfile" -t ./

echo "TDS package created: $outfile"
exit 0