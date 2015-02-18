# Fix up preremove script so it will do the KanjiMap substitutions
# involving @kanjiEmbed@ and @kanjiVariant@; otherwise the
# corresponding maps will not be disabled.

PN="texlive-collection-langjapanese"

mv /etc/preremove/${PN}.sh /etc/preremove/${PN}.in
cp /etc/preremove/${PN}.new /etc/preremove/${PN}.sh
