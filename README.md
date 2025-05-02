# usnum
project om gebruikte bijsturingsnummers Nederlandse Spoorwegen te maken.

Draait op linux platform met versie beheer systeem RCS en curl geinstalleerd (meestal standaard mee geleverd).

Installatie:
maak folder RCS aan in huidige foler

Voeg in hoofd folder twee key bestanden toe:
nsapi.key - access key van NS API 
fput.key - key voor ftp server (naam nu nog hard gecodeerd)

vroeg in beide scipts op de 2 regel het huidige pad in in plaats van ~/NSproj/trvolg/usnum

Run dan eenmaal beide scripts en check goede output
./chkdpnrs.sh
op de web server hoort nu een daynrs.json,v te staan
./mvdpnrs.sh
in RCS hoort nu een daynrs.json,v te staan

installeer een crontab
*/15 * * * * /home/<path>/usnum/chkdpnrs.sh
22 3 * * * /home/<path>/usnum/mvdpnrs.sh


De versie historie in git is gemaakt uit de RCS versie history van de sh files via https://rsmith.home.xs4all.nl/problems/converting-rcs-history-to-git.html

