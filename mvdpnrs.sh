#!/bin/sh
cd ~/NSproj/trvolg/usnum
olst=daynrs.json
tlst=dpnrs.lst
rm -f RCS/$tlst,v
ci -q -d -l -m-msg -t-title $olst *.sh
rm $olst

