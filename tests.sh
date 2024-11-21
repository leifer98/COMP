#!/bin/bash

# Directory containing test files
TEST_DIR="hw1-tests"

# Executable to be tested
EXECUTABLE="./hw1"

# Iterate through all test input files in numerical order
for test_file in $(ls ${TEST_DIR}/t*.in | sort -V); do
    # Extract the test number from the filename
    test_number=$(basename "$test_file" | grep -oP '(?<=t)\d+')
    
    # Define the result file and expected output file
    result_file="${TEST_DIR}/t${test_number}.res"
    expected_file="${TEST_DIR}/t${test_number}.out"
    
    # Run the test and capture the output
    $EXECUTABLE < "$test_file" 2>&1 > "$result_file"
    
    # Compare the result with the expected output
    echo "Running Test $test_number..."
    if diff "$result_file" "$expected_file" > /dev/null; then
        echo "Test $test_number PASSED"
    else
        echo "Test $test_number FAILED"
        diff "$result_file" "$expected_file"
    fi
    echo
done
