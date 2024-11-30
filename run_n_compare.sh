#!/bin/bash

# Input and output directories
# INPUT_DIR="extra-tests/in/one_digit"
# OUTPUT_DIR="extra-tests/out2/one_digit"

INPUT_DIR="extra-tests/in/two_digits"
OUTPUT_DIR="extra-tests/out2/two_digits"

# Colors for output
GREEN='\033[0;32m'  # Green for success
RED='\033[0;31m'    # Red for failure
NC='\033[0m'        # No color (reset)

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each file in the input directory
for input_file in "$INPUT_DIR"/*; do
    # Get the base name of the file (e.g., file.txt -> file)
    base_name=$(basename "$input_file")
    base_name_no_ext="${base_name%.*}"  # File name without extension

    # Construct the .res and .out file paths
    res_file="$OUTPUT_DIR/${base_name_no_ext}.res"
    out_file="$OUTPUT_DIR/${base_name_no_ext}_out.${base_name_no_ext}"

    # Run ./hw1 and redirect the output to the .res file
    ./hw1 < "$input_file" > "$res_file"
    echo "Generated $res_file"

    # Compare the .res file with the .out file
    if [ -f "$out_file" ]; then
        diff_output=$(diff "$res_file" "$out_file")
        if [ -z "$diff_output" ]; then
            echo -e "${GREEN}Comparison PASSED for $base_name_no_ext${NC}"
        else
            echo -e "${RED}Comparison FAILED for $base_name_no_ext${NC}"
            echo "$diff_output"
        fi
    else
        echo -e "${RED}No .out file found for $base_name_no_ext. Skipping comparison.${NC}"
    fi
done

