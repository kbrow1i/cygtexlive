#! /bin/bash

dirs="
texlive-collection-binextra
texlive-collection-fontsextra-doc
texlive-collection-latexextra-doc
texlive-collection-mathscience
texlive-collection-music
texlive-collection-pictures
texlive-collection-pstricks
texlive-collection-langarabic
"

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    eval $(grep '^NAME=' *.cygport)
    eval $(grep '^VERSION=' *.cygport)
    eval $(grep '^RELEASE=' *.cygport)
    PVR=${NAME}-${VERSION}-${RELEASE}
    D=${PVR}.noarch
    sed -i -e '/^requires:/s/ python3//' ${D}/dist/${NAME}/${PVR}.hint
    echo "Leaving $d"
    cd ..
done
