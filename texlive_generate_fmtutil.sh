#! /bin/bash

# This script recreates /etc/texmf/web2c/fmtutil.cnf by moving the
# original one and re-running all "fmtutil-sys --enablefmt" commands
# from postinstall scripts of installed packges.  It might be needed
# whenever there is a change in /usr/share/texmf/web2c/fmtutil.cnf,
# either because of upstream changes or because I've changed it.

# As of this writing (12/25/2012), there have been two such changes.
# The first was an upstream change from 2011 to 2012 involving formats
# that are built by texlive-collection-langcjk.  The second was a
# change made by me in 12/2012 when I realized that all formats ought
# to be disabled initially.

confdir=/etc/texmf/web2c
if [ -f ${confdir}/fmtutil.cnf ]
then
    mv -fv ${confdir}/fmtutil.cnf ${confdir}/fmtutil.cnf.bak
fi
for p in $(/usr/bin/cygcheck -cd | grep texlive-collection | cut -d ' ' -f1)
do
    if [ -f /etc/postinstall/${p}.sh ]
    then
	script=/etc/postinstall/${p}.sh
    elif [ -f /etc/postinstall/${p}.sh.done ]
    then
	script=/etc/postinstall/${p}.sh.done
    else
	script=none
    fi
    if [ ${script} != none ]
    then
	grep 'fmtutil-sys --enablefmt' ${script} \
	    | while read line; do ${line}; done
    fi
done
