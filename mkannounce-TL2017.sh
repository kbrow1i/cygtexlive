#! /bin/bash

VR=201705xx-1

cat > announce-TL2017.txt <<EOF
Cygwin's TeX Live packages have been updated to the latest upstream release, TeX Live 2017.

TeX Live provides a comprehensive, cross-platform TeX system.  It includes all the major TeX-related programs, macro packages, and fonts that are free software, including support for many languages around the world.  For more information, see

  http://www.tug.org/texlive/

There have been major changes to LuaTeX since TeX Live 2016????  See

  http://www.tug.org/texlive/doc/texlive-en/texlive-en.html#news

for details, as well as for a list of other (minor) changes.
  
The TeX Live executables and supporting libraries are contained in the following Cygwin packages:

* texlive-${VR}

* libkpathsea6-${VR}
* libkpathsea-devel-${VR}

libkpathsea is a TeX file and path search library.

* libptexenc1-${VR}
* libptexenc-devel-${VR}

libptexenc is a TeX Unicode encoding library.

* libsync1-${VR}
* libsync-devel-${VR}

libsync is a TeX source/output synchronization library.

* libtexlua52_5-${VR}
* libtexlua52-devel-${VR}

libtexlua52 is a TeX lua scripting library.

* libtexluajit2-${VR} (x86 only)
* libtexluajit-devel-${VR} (x86 only)

libtexluajit is a TeX Just-In-Time lua compiler library.

* asymptote-2.41-1

Asymptote is a powerful descriptive vector graphics language for technical drawing, inspired by MetaPost but with an improved C++-like syntax.  Asymptote provides for figures the same high-quality typesetting that LaTeX does for scientific text.

In addition, upstream TeX Live provides thousands of "packages", grouped into "collections".  There is a Cygwin package for each upstream collection; there are also Cygwin packages containing documentation for some of the collections.

EOF

packages="texlive-collection-*"

for d in ${packages}
do
    case ${d} in
	*-htmlxml) ;;
	*) echo "* ${d}-${VR}" >> announce-TL2017.txt ;;
    esac
    echo "* ${d}-${VR}" >> announce-TL2017.txt
done

cat >> announce-TL2017.txt <<EOF
There has been some (upstream) rearrangement of the collections since the previous release:

 - The langafrican and langindic collections have been absorbed by langother.

 - The omega collection has been absorbed by formatsextra.

 - The plainextra, genericrecommended, and genericextra collections have merged into a new collection, genericplain.

 - The htmlxml collection has been removed.  Its constituent upstream packages have been moved into other collections, as follows:

   jadetex, passivetex, xmltex, xmltexconfig --> formatsextra
   classpack --> latexextra
   lwarp --> latexrecommended
   tex4ht --> genericplain

EOF

cat >> announce-TL2017.txt <<EOF

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
* texlive-collection-mathscience
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

# [1] Instructions for building biber-2.7:

#  - Install perl-5.24, currently available for Cygwin as a test release.

#  - Install Module::Build:

#      $ cpan Module::Build

#  - Download the biber-2.7 source:

#      $ git clone git@github.com:plk/biber.git

#      $ cd biber

#  - Create the build script and install the prerequisites via cpan:

#      $ perl Build.PL

#      $ ./Build installdeps  # Watch for failures and deal with them.
#                             # For example, you may need to install
#                             # some Cygwin packages, such as
#                             # libxslt-devel.

#  - Install biber:

#      $ ./Build test
#      $ ./Build install
