#! /bin/bash

dirs="texlive-collection-*"
exit_status=0
touch failures.txt

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    if ! cygport ${d}.cygport fetch
    then
	echo "Fetching ${d} failed" >> ../failures.txt
	exit_status=1
    fi
    echo "Leaving $d"
    cd ..
done
exit $exit_status
