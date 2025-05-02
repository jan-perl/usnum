#!/bin/sh
cd ~/NSproj/trvolg/usnum
tlst=dpnrs.lst
curl -s -o vtrain.json -H "Cache-Control: no-cache" -H "$(cat nsapi1.key)" 'https://gateway.apiportal.ns.nl/virtual-train-api/api/vehicle?features=bus'
cat vtrain.json | sed -e 's+,+,\
+g' | grep -e ritId | grep -e '"[0-9].....[0-9]' -e '"[0-9]....[0-9]' | sort > $tlst
ci -q -d -l -m-msg -t-title $tlst *.sh
olst=daynrs.json
echo '{"payload":{"RitIds":[' > $olst
grep ritId RCS/$tlst,v | sed -e 's-^@--' -e 's+"ritId":+{"ritId":+' -e 's+,+},+' | sort -u >> $olst
echo '{"TerminateID":"909901"}]}}' >> $olst
curl -s -T "$olst" --user $(cat fput.key) ftp.spoorgloren.nl/web/daynum/ 
