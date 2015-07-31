#! /bin/bash

eval $(grep '^NAME=' *.cygport)
eval $(grep '^VERSION=' *.cygport)
eval $(grep '^RELEASE=' *.cygport)

if grep -q '^ARCH=noarch$' *.cygport
then
    ARCH=noarch
else
    ARCH=$(uname -m)
fi

D=${NAME}-${VERSION}-${RELEASE}.${ARCH}
sed -i -e '/^requires:/s/ python3 python3-pygments//' ${D}/dist/${NAME}/setup.hint
