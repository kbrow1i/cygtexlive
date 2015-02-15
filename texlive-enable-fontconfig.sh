#! /bin/bash
ln -s /etc/fonts/conf.avail/09-texlive.conf /etc/fonts/conf.d/09-texlive.conf
/usr/bin/fc-cache -f \
  /usr/share/texmf-dist/fonts/opentype \
  /usr/share/texmf-dist/fonts/truetype \
  /usr/share/texmf-dist/fonts/type1

