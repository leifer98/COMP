#!/bin/bash

# Compiler settings
CC=g++
CFLAGS="-std=c++17"

# Clean previous outputs
clean() {
    rm -f lex.yy.* parser.tab.* hw5 output.ll output.s output result.txt result.out
}

# Function to compile the project
compile() {
    flex scanner.lex
    bison -Wcounterexamples -d parser.y
    $CC $CFLAGS -o hw5 *.c *.cpp

    if [ $? -ne 0 ]; then
        echo "Compilation failed."
        exit 1
    fi
}

# Function to run a specific test case with detailed output
run_test_detailed() {
    local test_case="$1"
    echo "Running test: $test_case"
    
    ./hw5 < "hw5-tests/$test_case.in" > output.ll 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Compilation failed while processing input $test_case"
        cat output.ll
        return
    fi

    llc output.ll -o output.s 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Compilation to executable failed for test $test_case"
        cat output.s
        return
    fi

    clang output.s -o output 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Executable creation failed for test $test_case"
        return
    fi

    ./output > result.txt 2>&1
    diff_result=$(diff result.txt "hw5-tests/$test_case.out")

    if [ $? -ne 0 ]; then
        echo "Test $test_case failed: output mismatch"
        echo "$diff_result"
    else
        echo "Test $test_case passed."
    fi
}

# Function to run a test with summarized output
run_test_summarized() {
    local test_case="$1"
    echo "Running test: $test_case"

    ./hw5 < "hw5-tests/$test_case.in" > output.ll 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Compilation failed for test $test_case"
        return
    fi

    llc output.ll -o output.s 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Compilation to executable failed for test $test_case"
        return
    fi

    clang output.s -o output 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Executable creation failed for test $test_case"
        return
    fi

    ./output > result.out 2>&1
    diff result.out "hw5-tests/$test_case.out" > /dev/null

    if [ $? -ne 0 ]; then
        echo "Test $test_case failed: output mismatch"
    else
        echo "Test $test_case passed."
    fi
}

# Function to run all tests
run_all_tests() {
    for test_file in hw5-tests/*.in; do
        test_name=$(basename "$test_file" .in)
        run_test_summarized "$test_name"
        echo "----------------------"
    done
}

# Handle script parameters
if [ "$1" == "clean" ]; then
    clean
    echo "Cleaned all generated files."
elif [ -n "$1" ]; then
    clean
    compile
    run_test_detailed "$1"
else
    clean
    compile
    run_all_tests
fi
