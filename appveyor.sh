#!/bin/sh
exit_status=0

./fetch.sh 2>&1 | tee myfetch.log || exit_status=1

tar -cJf artifact.tar.xz failures.txt myfetch.log

exit $exit_status
