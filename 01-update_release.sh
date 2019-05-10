#! /bin/bash

dirs="texlive-collection-*"

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    sed -i -e 's/^VERSION=.*/VERSION=20190509/' ${d}.cygport
    rm -rf ${d}-20190410-1.noarch
    # sed -i -e 's/^RELEASE=.*/RELEASE=1/' ${d}.cygport
    # mkdir -p save
    # mv -f *.tar.xz save/
    echo "Leaving $d"
    cd ..
done
