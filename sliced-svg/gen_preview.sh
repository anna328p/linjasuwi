#!/usr/bin/env bash

i=0
while read -r word; do
	printf '<div class="nimi">'
		printf '<div class="nimi-suli">'
			printf '<img src="sliced-svg/output/%04d-%s.svg">' "$i" "$word"
		printf '</div>'
		printf '<div class="nimi-lasin">'
			printf '<span class="inli">%s</span>' $word
		printf '</div>'
	printf '</div>\n'
	i=$(( $i + 1 ))
done < namelist.txt
