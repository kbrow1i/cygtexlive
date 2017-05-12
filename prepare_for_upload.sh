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
    cp -alf ${D}/${d} ${dest1}
    cp -alf ${D}/${d} ${dest2}
    # cp ${D}/${d}/setup.hint ${dest}/${d}
    echo "Leaving $d"
    echo
    cd ..
done
