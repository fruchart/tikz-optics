#!/bin/bash    
# Script to create a CTAN package for the tikzoptics library.
#
# This script is part of the tikzoptics library and is subject to
# the same licenses: it can be distributed and/or modified under the 
# LLPL 1.3c or the GNU GPL 2 (or later).

# create a temporary directory (to put the contents of the zip file to be)
# and register a cleanup function to remove it at EXIT
readonly tmpdir=$(mktemp -d)
function cleanup {
  rm -r "$tmpdir"
}
trap cleanup EXIT

# create a folder (to stay in the zip) and put our files in it
ctandir="$tmpdir/tikz-optics/"
mkdir -p "$ctandir"
cp README -t "$ctandir"
cp tikzlibraryoptics.code.tex -t "$ctandir"
cp doc/tikz-optics.tex -t "$ctandir"
cp doc/tikz-optics.pdf -t "$ctandir"
# if a TDS-structured archive exists, we include it
if [ -f "tikz-optics.tds.zip" ]; then
	cp "tikz-optics.tds.zip" -t "$ctandir"
else
	echo -e "\e[1m\e[91mWarning:\e[39m\e[21m no tikz-optics.tds.zip" \
	"file found so it will not be included; use build_tds.sh to create/update it."
fi


# zip the contents into the CTAN package
outfile="tikz-optics.zip"
if [ -e outfile ]; then
	rm "$outfile"
fi;
pushd "$tmpdir" > /dev/null
zip -qr "$outfile" ./
popd > /dev/null
mv "$tmpdir/$outfile" -t ./

echo "CTAN package created: $outfile"
exit 0