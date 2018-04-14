#! /bin/bash

export TEXLIVE_PRETEST=1

dirs="texlive-collection-*"
exit_status=0
rm -f fetch_failures.txt
touch fetch_failures.txt

for d in $dirs
do
    echo "Entering $d ..."
    cd $d
    # eval $(grep ^VERSION ${d}.cygport)
    if ! cygport ${d}.cygport fetch
    then
	echo "Fetching ${d} failed" >> ../fetch_failures.txt
	exit_status=1
    fi
    echo "Leaving $d"
    cd ..
done
exit $exit_status
