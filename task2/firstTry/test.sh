#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No color

# Directory containing the test files
TEST_DIR="hw2-tests"

# Counters for statistics
total_tests=0
passed_tests=0

# Function to run a single test
run_test() {
    local test_name=$1
    total_tests=$((total_tests + 1)) # Increment total tests

    # Run the test
    ./hw2 < "${TEST_DIR}/${test_name}.in" > "${TEST_DIR}/my_${test_name}.out"

    # Compare the output with the expected result
    diff <(sed 's/^[0-9]\+/0/g;/TypeAnnotation -> epsilon/d;s/TypeAnnotation Type/Type/g' "${TEST_DIR}/my_${test_name}.out") <(sed 's/^[0-9]\+/0/g;/TypeAnnotation -> epsilon/d;s/TypeAnnotation Type/Type/g' "${TEST_DIR}/${test_name}.out") &> /dev/null

    if [ $? -ne 0 ]; then
        echo -e "[${RED}FAILED${NC}] - Test $test_name"
    else
        echo -e "[${GREEN}OK${NC}]  - Test $test_name"
        passed_tests=$((passed_tests + 1)) # Increment passed tests
    fi
}

# If no arguments are provided, run all tests
if [ $# -eq 0 ]; then
    echo "Running all Segel tests..."

    # Get all input files in the directory
    input_files=($(ls ${TEST_DIR}/*.in))

    # Loop through all input files
    for input_file in "${input_files[@]}"; do
        # Extract the test number from the file name
        test_name=$(basename "$input_file" .in)
        run_test "$test_name"
    done
else
    # Run a specific test based on the number provided
    TEST_NUM=$1
    TEST_FILE="${TEST_DIR}/t${TEST_NUM}.in"

    if [ -f "$TEST_FILE" ]; then
        echo "Running Segel test t${TEST_NUM}..."
        run_test "t${TEST_NUM}"
    else
        echo -e "[${RED}ERROR${NC}] - Test file t${TEST_NUM}.in not found in ${TEST_DIR}"
        exit 1
    fi
fi

# Statistics and feedback in one line
if [ $total_tests -gt 0 ]; then
    # Calculate percentage using integer math
    percentage=$(( 100 * passed_tests / total_tests ))

    # Default feedback is for success
    feedback="${GREEN}All tests passed!${NC}"

    # Check thresholds for partial success or debugging
    if [ $percentage -lt 50 ]; then
        feedback="${RED}Needs debugging${NC}"
    elif [ $percentage -lt 100 ]; then
        feedback="${CYAN}Partial success${NC}"
    fi

    # Print summary
    echo -e "Summary: total ${passed_tests}\\${total_tests} passed, success = ${CYAN}${percentage}%${NC} - ${feedback}"
else
    echo -e "${RED}No tests were run. Check your inputs.${NC}"
fi


