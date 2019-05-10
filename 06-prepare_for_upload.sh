#! /bin/bash

dirs="texlive-collection-*"

for d in ${dirs}
do
    echo "Entering $d ..."
    cd $d
    eval $(grep '^NAME=' ${d}.cygport)
    eval $(grep '^VERSION=' ${d}.cygport)
    eval $(grep '^RELEASE=' ${d}.cygport)
    PVR=${NAME}-${VERSION}-${RELEASE}
    D=${PVR}.noarch/dist
    dest1=/c/downloads/cygwin/myrepo/noarch/release
    dest2=/tmp/sourceware/noarch/release
    rm -rf ${dest1}/${d}
    cp -alf ${D}/${d} ${dest1}
    # rm -rf ${dest2}/${d}
    cp -alf ${D}/${d} ${dest2}
    echo "Leaving $d"
    echo
    cd ..
done
