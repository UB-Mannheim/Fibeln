#!/usr/bin/env bash

# Get all missing page images for the Fibeln data set.

for ppn in PPN1011424150 PPN1020133104 PPN1024726142 PPN1024784126 PPN1025195825; do (
  cd $ppn
  for xml in *.xml; do 
    filename="$(grep imageFilename $xml|perl -pe 's/^.*imageFilename="(.*(jpg|png|tif))".*/$1/')"
    extension="$(echo $filename|perl -pe 's/.*([.].*)/$1/')"
    base=$(basename $filename $extension)
    url="https://gei-digital.gei.de/viewer/api/v1/records/$ppn/files/images/$base.tif/full/max/0/default$extension"
    test -f "$filename" && echo "$ppn/$filename already exists" || (echo "$ppn/$filename - $url"; curl -s -o "$filename" "$url")
  done
) done

(
  ppn=PPN643815198
  cd $ppn
  for xml in *.xml; do
    filename=$(grep imageFilename $xml|perl -pe 's/^.*imageFilename="(.*jpg)".*/$1/')
    url=$(grep externalRef $xml|perl -pe 's/^.*(http.*jpg).*/$1/')
    test -f "$filename" && echo "$ppn/$filename already exists" || (echo "$ppn/$filename - $url"; curl -s -o "$filename" "$url")
  done
)

