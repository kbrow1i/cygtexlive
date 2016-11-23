#! /bin/bash

eval $(grep '^NAME=' *.cygport)
eval $(grep '^VERSION=' *.cygport)
eval $(grep '^RELEASE=' *.cygport)

ARCH=noarch
D=${NAME}-${VERSION}-${RELEASE}.${ARCH}
sed -i -e '/^requires:/s/ lua//' ${D}/dist/${NAME}/setup.hint
