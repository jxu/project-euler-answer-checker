#!/bin/bash
# Uses Solutions.md from https://github.com/luckytoilet/projecteuler-solutions 
# First convert Solutions.md into a machine-readable form (with unix newlines) where line n is just the solution string for problem n.
# This assumes the format of Solutions.md where problems start on line 6 and the last 2 lines of the file do not have solutions.
# It also assumes each solution line starts with the problem number and then a dot, ex. "123. 456", possibly with extra whitespace.

cat Solutions.md | dos2unix | tail -n +6 | head -n -2 | perl -pe 's/^[0-9]+\.//gm' | awk '{$1=$1}1' > solutions.txt

# Then create a file with a md5 hash of the solution string if it exists, else a blank line.

while read -r line ; do 
    [[ $line ]] && echo -n $line | md5sum | cut -f1 -d ' ' || echo
done < solutions.txt > solutions_md5.txt 

