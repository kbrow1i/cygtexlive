#! /bin/bash

PVR=20170412-1

cat > announce.txt <<EOF
Cygwin's TeX Live collections have been updated to the latest upstream release of TeX Live 2016, which was frozen as of 2017-04-12.  (TeX Live 2017 will probably be released in about a month.)

TeX Live provides a comprehensive, cross-platform TeX system.  It includes all the major TeX-related programs, macro packages, and fonts that are free software, including support for many languages around the world.  For more information, see

  http://www.tug.org/texlive/

Upstream TeX Live provides thousands of "packages", grouped into "collections".  There is a Cygwin package for each upstream collection; there are also Cygwin packages containing documentation for some of the collections.

EOF

packages="texlive-collection-*"

for d in ${packages}
do
    case ${d} in
	*-bibtexextra*) echo "* ${d}-${PVR} (TEST)" >> announce.txt ;;
	*) echo "* ${d}-${PVR}" >> announce.txt ;;
    esac
    # echo "* ${d}-${PVR}" >> announce.txt
done

cat >> announce.txt <<EOF

The mathscience collection is new; it is a combination of the old mathextra and science collections.

The bibtexextra collection is marked as a test release because it includes biblatex-3.7, which is designed to work with biber-2.7.  But Cygwin currently provides only biber-2.5, and this cannot be updated easily because it requires at least perl-5.24.  On the other hand, if you are familiar with cpan, you can build and install biber-2.7 yourself[1].
EOF

cat >> announce.txt <<EOF

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

[1] Instructions for building biber-2.7:

 - Install perl-5.24, currently available for Cygwin as a test release.

 - Install Module::Build:

     $ cpan Module::Build

 - Download the biber-2.7 source:

     $ git clone git@github.com:plk/biber.git

     $ cd biber

 - Create the build script and install the prerequisites via cpan:

     $ perl Build.PL

     $ ./Build installdeps  # Watch for failures and deal with them.
                            # For example, you may need to install
                            # some Cygwin packages, such as
                            # libxslt-devel.

 - Install biber:

     $ ./Build test
     $ ./Build install
EOF
