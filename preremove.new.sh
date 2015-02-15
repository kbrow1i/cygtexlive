PN="texlive-collection-langjapanese"
dir="/etc/preremove"

eval $(/usr/bin/updmap-sys --showoption kanjiEmbed | grep '^kanjiEmbed=' \
	    | sed -e 's/\(^kanjiEmbed=[^ ]*\).*/\1/')
eval $(/usr/bin/updmap-sys --showoption kanjiVariant | grep '^kanjiVariant=' \
	    | sed -e 's/\(^kanjiVariant=[^ ]*\).*/\1/')
echo '#!/bin/bash' > ${dir}/${PN}.out
sed -e "s/@kanjiEmbed@/${kanjiEmbed}/" \
    -e "s/@kanjiVariant@/${kanjiVariant}/" \
    < ${dir}/${PN}.in \
    >> ${dir}/${PN}.out
chmod 755 ${dir}/${PN}.out
exec ${dir}/${PN}.out
