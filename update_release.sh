#! /bin/bash

dirs="texlive-collection-*"

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    sed -i -e 's/^VERSION=.*/VERSION=20170412/' ${d}.cygport
    sed -i -e 's/^RELEASE=.*/RELEASE=1/' ${d}.cygport
    mkdir -p save
    mv *.tar.xz save/
    echo "Leaving $d"
    cd ..
done
