Neue Fibel. Göttingen (1782). Verlag Johann Christian Dieterich

- PURL: http://resolver.sub.uni-goettingen.de/purl?PPN643815198
- METS: https://gdz.sub.uni-goettingen.de/mets/PPN643815198.mets.xml
- IIIF manifest: https://manifests.sub.uni-goettingen.de/iiif/presentation/PPN643815198/manifest?version=2d651b49

Die Transkription wurde mit Hilfe von eScriptorium erstellt, als PAGE XML dort exportiert
und mit folgenden Kommandos bearbeitet:

```
# PPN wählen (Beispiel, anzupassen).
ppn=PPN643815198
# Leerzeilen entfernen.
perl -i -ne "tr|\r||d; next if /^\s*$/;print" *.xml
# Dateien umbenennen.
for i in $(ls [0-9]*.xml | sort -n | sed "s/_.*//"); do mv -v ${i}_*xml ${ppn}_$(printf %04u $(expr $i + 1)).xml; done
# Namen der Bilddateien korrigieren.
for f in *.xml; do i=$(echo $f|sed 's/.*_//'|sed s/.xml//); perl -pi -e "s,imageFilename=.*jpg.,imageFilename=\"${ppn}_${i}.jpg\"," $f; done                

# Fehlerhaft transkribierte Umlaute korrigieren.
perl -pi -e s/äͤ/aͤ/g $(find * -name "*.xml")
perl -pi -e s/öͤ/oͤ/g $(find * -name "*.xml")
perl -pi -e s/üͤ/uͤ/g $(find * -name "*.xml")
```
