#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes that simultaneously try to write to the files
(echo "Process 1" > file1.txt &) 
(echo "Process 2" > file2.txt &)

# Wait for both processes to finish
wait

# Check the content of the files. In some runs you will find the content is missing
cat file1.txt
cat file2.txt
rm file1.txt file2.txt