#!/bin/sh

rm -f /usr/lib/*.la

exit_status=0

# ./fetch.sh 2>&1 | tee myfetch.log || exit_status=1
# tar -cJf artifact.tar.xz failures.txt myfetch.log

cd texlive
cygport texlive.cygport fetch all test || exit_status=1
tar -cJf artifact.tar.xz texlive-*/dist texlive-*/log

exit $exit_status
