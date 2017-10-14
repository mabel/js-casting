#!/bin/bash

SRC="`ls *.json | sed 's/\.json//'`"
DESCR="`pwd | egrep -o '[^\/]+$'`"
OPTIONS="{\"description\":\"$DESCR\",\"src\":\"$SRC\"}"

pug -O "$OPTIONS" -o . ../lib/asciinema.pug

cp asciinema.html "../public/asciinema/$SRC.html"

if [ -f "$SRC.mp3" ]; then
    cp "$SRC.mp3"     "../public/asciinema/"
    cp "$SRC.json"    "../public/asciinema/"
fi

find .. -name '*.json' | grep '../0' | sed 's/^\.\.\/[0-9]\+\./*/' > ../lib/themes.md

pug . -o ../public ../lib/index.pug

