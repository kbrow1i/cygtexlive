#! /bin/bash

dirs="texlive-collection-*"

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    cygport ${d}.cygport fetch
    echo "Leaving $d"
    cd ..
done
