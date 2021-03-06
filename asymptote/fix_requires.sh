#! /bin/bash

eval $(grep '^NAME=' *.cygport)
eval $(grep '^VERSION=' *.cygport)
eval $(grep '^RELEASE=' *.cygport)
PVR=${NAME}-${VERSION}-${RELEASE}

ARCH=$(uname -m)

D=${PVR}.${ARCH}
sed -i -e '/^requires:/s/ python3//' ${D}/dist/${NAME}/${PVR}.hint
