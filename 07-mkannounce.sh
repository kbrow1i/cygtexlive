#! /bin/bash

VR=20190410-1

cat > announce-TL2019.txt <<EOF
Cygwin's TeX Live packages have been updated to the latest upstream release, TeX Live 2019.

TeX Live provides a comprehensive, cross-platform TeX system.  It includes all the major TeX-related programs, macro packages, and fonts that are free software, including support for many languages around the world.  For more information, see

  http://www.tug.org/texlive/

And see

  http://www.tug.org/texlive/doc/texlive-en/texlive-en.html#news

for a list of changes since TeX Live 2018.
  
The TeX Live executables and supporting libraries are contained in the following Cygwin packages:

* texlive-${VR}

* libkpathsea6-${VR}
* libkpathsea-devel-${VR}

libkpathsea is a TeX file and path search library.

* libptexenc1-${VR}
* libptexenc-devel-${VR}

libptexenc is a TeX Unicode encoding library.

* libsync2-${VR}
* libsync-devel-${VR}

libsync is a TeX source/output synchronization library.

* libtexlua53_5-${VR}
* libtexlua53-devel-${VR}

libtexlua53 is a TeX lua scripting library.

* libtexluajit2-${VR}
* libtexluajit-devel-${VR}

libtexluajit is a TeX Just-In-Time lua compiler library.

* asymptote-2.49-1

Asymptote is a powerful descriptive vector graphics language for technical drawing, inspired by MetaPost but with an improved C++-like syntax.  Asymptote provides for figures the same high-quality typesetting that LaTeX does for scientific text.

In addition, upstream TeX Live provides thousands of "packages", grouped into "collections".  There is a Cygwin package for each upstream collection; there are also Cygwin packages containing documentation for some of the collections.

EOF

packages="texlive-collection-*"

for d in ${packages}
do
    echo "* ${d}-${VR}" >> announce-TL2019.txt
done

cat >> announce-TL2019.txt <<EOF

Recommendations
===============
Most people do not need the full TeX Live installation, which is huge and can take a long time to install.  If you're not sure what you need, here are some possible ways to start:

Minimal: Install texlive and its dependencies.  This provides plain TeX but not LaTeX.

Basic: Install texlive-collection-latex and its dependencies.  This is a minimal installation with LaTeX.

Small: Install texlive-collection-latexrecommended and its dependencies.  This provides the most commonly used non-graphics LaTeX packages.  Install texlive-collection-pictures if you want the standard graphics packages too.

Medium: Install texlive-collection-binextra, texlive-collection-context, texlive-collection-fontsrecommended, texlive-collection-fontutils, texlive-collection-latexrecommended, texlive-collection-luatex, texlive-collection-mathscience, texlive-collection-metapost, texlive-collection-plaingeneric, and texlive-collection-xetex.

Fontconfig
==========
There is a script /usr/bin/texlive-enable-fontconfig that you can run if you want the fonts distributed with TeX Live to be available to applications that rely on fontconfig.  See /usr/share/doc/texlive/README.Cygwin for more details.  (The script can take a few minutes to run, so be patient.)

tlmgr
=====
texlive-collection-basic includes a restricted version of the tlmgr (TeX Live Manager) utility.  See /usr/share/doc/texlive-collection-basic/README.Cygwin for more details.

Ken Brown
Cygwin's TeX Live maintainer
EOF
