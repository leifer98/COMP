#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No color

# Directory containing the test files
TEST_DIR="hw2-tests"

# Get all input files in the directory
input_files=($(ls ${TEST_DIR}/*.in))

echo "Running Segel tests..."

# Loop through all input files
for input_file in "${input_files[@]}"
do
    # Extract the test number from the file name
    test_name=$(basename "$input_file" .in)
    
    # Run the test
    ./hw2 < "$input_file" > "${TEST_DIR}/my_${test_name}.out"

    # Compare the output with the expected result
    diff <(sed 's/^[0-9]\+/0/g;/TypeAnnotation -> epsilon/d;s/TypeAnnotation Type/Type/g' "${TEST_DIR}/my_${test_name}.out") <(sed 's/^[0-9]\+/0/g;/TypeAnnotation -> epsilon/d;s/TypeAnnotation Type/Type/g' "${TEST_DIR}/${test_name}.out") &> /dev/null

    if [ $? -ne 0 ]; then
        echo -e "[${RED}FAILED${NC}] - Test $test_name"
    else
        echo -e "[${GREEN}OK${NC}]  - Test $test_name"
    fi
done
