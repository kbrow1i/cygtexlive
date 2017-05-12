#! /bin/bash

PVR=20160520-1

cat > announce-TL2016.txt <<EOF
Cygwin's TeX Live packages have been updated to the latest upstream release, TeX Live 2016.

TeX Live provides a comprehensive, cross-platform TeX system.  It includes all the major TeX-related programs, macro packages, and fonts that are free software, including support for many languages around the world.  For more information, see

  http://www.tug.org/texlive/

There have been major changes to LuaTeX since TeX Live 2015.  See

  http://www.tug.org/texlive/doc/texlive-en/texlive-en.html#news

for details, as well as for a list of other (minor) changes.
  
The TeX Live executables and supporting libraries are contained in the following Cygwin packages:

* texlive-${PVR}

* libkpathsea6-${PVR}
* libkpathsea-devel-${PVR}

libkpathsea is a TeX file and path search library.

* libptexenc1-${PVR}
* libptexenc-devel-${PVR}

libptexenc is a TeX Unicode encoding library.

* libsync1-${PVR}
* libsync-devel-${PVR}

libsync is a TeX source/output synchronization library.

* libtexlua52_5-${PVR}
* libtexlua52-devel-${PVR}

libtexlua52 is a TeX lua scripting library.

* libtexluajit2-${PVR} (x86 only)
* libtexluajit-devel-${PVR} (x86 only)

libtexluajit is a TeX Just-In-Time lua compiler library.

* asymptote-2.38-1

Asymptote is a powerful descriptive vector graphics language for technical drawing, inspired by MetaPost but with an improved C++-like syntax.  Asymptote provides for figures the same high-quality typesetting that LaTeX does for scientific text.

In addition, upstream TeX Live provides thousands of "packages", grouped into "collections".  There is a Cygwin package for each upstream collection; there are also Cygwin packages containing documentation for some of the collections.

EOF

packages="texlive-collection-*"

for d in ${packages}
do
    # case ${d} in
	# *-basic) echo "* ${d}-20150617-1" >> announce-TL2016.txt ;;
	# *) echo "* ${d}-${PVR}" >> announce-TL2016.txt ;;
    # esac
    echo "* ${d}-${PVR}" >> announce-TL2016.txt
done

cat >> announce-TL2016.txt <<EOF

Recommendations
===============
Most people do not need the full TeX Live installation, which is huge and can take a long time to install.  If you're not sure what you need, here are some possible ways to start:

Minimal: Install texlive and its dependencies.  This provides plain TeX but not LaTeX.

Small: Install texlive-collection-latex and its dependencies.  This is a minimal installation with LaTeX.

Standard: Install texlive-collection-latexrecommended and its dependencies.  This provides the most commonly used non-graphics LaTeX packages.  Install texlive-collection-pictures if you want the standard graphics packages too.

If you want or need more, consider installing some of the following:

* texlive-collection-binextra
* texlive-collection-context
* texlive-collection-fontsrecommended
* texlive-collection-fontutils
* texlive-collection-genericrecommended
* texlive-collection-luatex
* texlive-collection-mathextra
* texlive-collection-metapost
* texlive-collection-plainextra
* texlive-collection-xetex

Fontconfig
==========
There is a script /usr/bin/texlive-enable-fontconfig that you can run if you want the fonts distributed with TeX Live to be available to applications that rely on fontconfig.  See /usr/share/doc/texlive/README.Cygwin for more details.  (The script can take a few minutes to run, so be patient.)

tlmgr
=====
texlive-collection-basic includes a restricted version of the tlmgr (TeX Live Manager) utility.  See /usr/share/doc/texlive-collection-basic/README.Cygwin for more details.

Ken Brown
Cygwin's TeX Live maintainer
EOF
