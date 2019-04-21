#! /bin/bash

dirs="texlive-collection-*"
exit_status=0
rm -f build_failures.txt
touch build_failures.txt

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    if ! cygport ${d}.cygport finish all
    then
	echo "Building ${d} failed" >> ../build_failures.txt
	exit_status=1
    fi
    echo "Leaving $d"
    cd ..
done
exit $exit_status
