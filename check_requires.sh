#! /bin/bash

dirs="texlive-collection-*"

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    eval $(grep '^NAME=' ${d}.cygport)
    eval $(grep '^VERSION=' ${d}.cygport)
    eval $(grep '^RELEASE=' ${d}.cygport)
    PVR=${NAME}-${VERSION}-${RELEASE}
    D=${PVR}.noarch
    grep '^requires:' ${D}/dist/${NAME}/${PVR}.hint
    echo "Leaving $d"
    cd ..
done
