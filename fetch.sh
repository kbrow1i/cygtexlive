#! /bin/bash

export TEXLIVE_PRETEST=1

dirs="texlive-collection-*"
exit_status=0
touch failures.txt

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    eval $(grep VERSION ${d}.cygport)
    if [ ${VERSION} = 20170407 ]
    then
	if ! cygport ${d}.cygport fetch
	then
	    echo "Fetching ${d} failed" >> ../failures.txt
	    exit_status=1
	fi
    fi
    echo "Leaving $d"
    cd ..
done
exit $exit_status
