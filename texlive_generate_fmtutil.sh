#! /bin/bash

# /usr/share/texmf/web2c/fmtutil.cnf may have changed.  We need to
# incorporate those changes into /etc/texmf/web2c/fmtutil.cnf.  This
# script attempts to do this; it is called by a suitable
# texlive-collection-* postinstall script.

# The changes from 2011 to 2012 all involved formats that are built by
# texlive-collection-langcjk.  So I'll let the current script be run
# by the postinstall script for the latter.

if [ ! -f /etc/texmf/web2c/fmtutil.cnf ]
then
    exit
fi
enabled_fmts=$(/usr/bin/fmtutil-sys --listcfg | grep -v '^#!' | cut -d ' ' -f1)
disabled_fmts=$(/usr/bin/fmtutil-sys --listcfg | grep '^#!' | cut -d ' ' -f2)
mv /etc/texmf/web2c/fmtutil.cnf /etc/texmf/web2c/fmtutil.cnf.bak
for f in ${enabled_fmts}
do
    /usr/bin/fmtutil-sys --enablefmt $f
done
for f in ${disabled_fmts}
do
    /usr/bin/fmtutil-sys --disablefmt $f
done
