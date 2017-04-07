#!/bin/sh
exit_status=0

./fetch.sh || exit_status=1

tar -cJf artifact.tar.xz failures.txt \
    texlive-collection-*/texlive-collection-*/log

exit $exit_status
