#!/usr/bin/env bash

set -e

INPUT_DIR="$1"
OUTPUT_DIR="$2"

if [ -z "$INPUT_DIR" ] || [ -z "$OUTPUT_DIR" ]; then
	echo "Usage: $0 <input_dir> <output_dir>"
	exit 1;
fi

if [ ! -d "$INPUT_DIR" ]; then
	echo "Input directory does not exists"
	exit 1
fi

mkdir "$OUTPUT_DIR"

get_category(){
	FILE="$1"
	BASENAME="$(basename "$FILE")"

	if [[ "$BASENAME" == *.* ]]; then
		echo "${BASENAME##*.}"
	else
		echo "no_extension"
	fi
}

for FILE in "$INPUT_DIR"/*; do
	[ -f "$FILE" ] || continue
		CATEGORY=$(get_category "$FILE")
		OUTPUT_DESTINATION="$OUTPUT_DIR/$CATEGORY"
		mkdir -p "$OUTPUT_DESTINATION"
		mv "$FILE" "$OUTPUT_DESTINATION/"
	done


echo "done"
