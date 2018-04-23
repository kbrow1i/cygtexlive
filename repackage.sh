#! /bin/bash

# dirs="texlive-collection-*"
dirs="
texlive-collection-langother
texlive-collection-mathscience-doc
texlive-collection-mathscience
texlive-collection-plaingeneric-doc
texlive-collection-plaingeneric
"

exit_status=0
rm -f build_failures.txt
touch build_failures.txt

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    if ! cygport ${d}.cygport pkg
    then
	echo "Building ${d} failed" >> ../build_failures.txt
	exit_status=1
    fi
    eval $(grep '^NAME=' ${d}.cygport)
    eval $(grep '^VERSION=' ${d}.cygport)
    eval $(grep '^RELEASE=' ${d}.cygport)
    PVR=${NAME}-${VERSION}-${RELEASE}
    D=${PVR}.noarch/dist
    dest1=/c/downloads/cygwin/myrepo/noarch/release
    rm -rf ${dest1}/${d}
    cp -alf ${D}/${d} ${dest1}
    echo "Leaving $d"
    cd ..
done
exit $exit_status
