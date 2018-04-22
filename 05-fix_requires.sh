#! /bin/bash

# Recheck which ones should actually require python3.

dirs="
texlive-collection-binextra
texlive-collection-fontsextra-doc
texlive-collection-langarabic
texlive-collection-latexextra-doc
texlive-collection-mathscience
texlive-collection-music
texlive-collection-pictures
texlive-collection-pstricks
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
    case "$d" in
	*-binextra) sed -i -e '/^requires:/s/ python3.*-pygments//' \
			${D}/dist/${NAME}/${PVR}.hint ;;
	*) sed -i -e '/^requires:/s/ python3//' ${D}/dist/${NAME}/${PVR}.hint ;;
    esac
    echo "Leaving $d"
    cd ..
done
