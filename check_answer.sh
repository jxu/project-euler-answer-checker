#!/bin/bash

if [[ $# == 0 ]] ; then 
    echo "Usage: ./check_answer.sh [PROBLEM_NUM] [USER_ANSWER]"
    exit 1
fi

PROBLEM_NUM=$1
USER_ANSWER=$2

REF_MD5=$(sed -n "${PROBLEM_NUM}p" solutions_md5.txt)

if [[ $REF_MD5 ]] ; then
    USER_MD5=$(echo -n $2 | md5sum | cut -f1 -d ' ')
    [[ $USER_MD5 == $REF_MD5 ]] &&
        echo "Congratulations, the answer you gave to problem $PROBLEM_NUM is correct." ||
        echo "Sorry, but the answer you gave appears to be incorrect."
else
    echo 'No reference solution found.'
fi


