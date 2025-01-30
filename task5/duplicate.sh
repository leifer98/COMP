#!/bin/bash

# Ensure a test file is provided
if [ -z "$1" ]; then
  echo "Usage: ./duplicate.sh <basename of test file (e.g., t0)>"
  exit 1
fi

# Get the base test name (e.g., t0)
BASE_TEST="$1"
INPUT_DIR="./tests/our-tests"

# Ensure the input test files exist
if [ ! -f "$INPUT_DIR/$BASE_TEST.in" ] || [ ! -f "$INPUT_DIR/$BASE_TEST.out" ]; then
  echo "Error: $BASE_TEST.in or $BASE_TEST.out does not exist in $INPUT_DIR."
  exit 1
fi

# Find the next available test number
NEXT_NUM=0
while [ -f "$INPUT_DIR/t$NEXT_NUM.in" ] || [ -f "$INPUT_DIR/t$NEXT_NUM.out" ]; do
  NEXT_NUM=$((NEXT_NUM + 1))
done

# Create new test files
NEW_IN="$INPUT_DIR/t$NEXT_NUM.in"
NEW_OUT="$INPUT_DIR/t$NEXT_NUM.out"

cp "$INPUT_DIR/$BASE_TEST.in" "$NEW_IN"
cp "$INPUT_DIR/$BASE_TEST.out" "$NEW_OUT"

echo "Created $NEW_IN and $NEW_OUT"