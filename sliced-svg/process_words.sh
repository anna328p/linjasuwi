#!/usr/bin/env bash
set -e

out_dir=output

doc_width=10
num_entries=$(( $doc_width * 18 ))

tile_width=20

# Generate a single file
write_file () {
	local index=$1
	local name=$2

	local y_index=$(( $index / $doc_width * $tile_width ))
	local x_index=$(( $index % $doc_width * $tile_width ))

	printf -v out '%s/%04d-%s.svg' $out_dir $index $name

	sed <template.svg >$out \
		-e "s/%OX%/$x_index/" \
		-e "s/%OY%/$y_index/"

}

gen_files () {
	i=0
	while read -r word; do
		echo -n "$word "
		write_file "$i" "$word"
		i=$(($i + 1))
	done <namelist.txt
	echo
}

opt_files () {
	for file in "$out_dir"/*.svg; do
		[ -e "$file" ] || continue
		svgo --config svgo.yml $file
	done
}

rm -rf "$out_dir"
mkdir -p "$out_dir"

echo Generating...
gen_files

echo Optimizing...
opt_files
