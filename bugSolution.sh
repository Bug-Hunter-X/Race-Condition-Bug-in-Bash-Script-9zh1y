#!/bin/bash

# This script demonstrates a solution to the race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Use a lock file to prevent race conditions.  This ensures that only one process can write at a time
lockfile="lock.txt"

# Process 1
(flock $lockfile; echo "Process 1" > file1.txt) &

# Process 2
(flock $lockfile; echo "Process 2" > file2.txt) &

# Wait for both processes to finish
wait

# Check the content of the files
cat file1.txt
cat file2.txt
rm file1.txt file2.txt $lockfile