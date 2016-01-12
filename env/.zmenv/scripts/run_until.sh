#!/bin/bash

ITER=0

while true; do
    echo -e "$ITER...\c";

    START=$(date +%s);
    tools/validator.py --nuggets --dbg --testfilter "$1*" > /dev/null 2>&1;

    status=$?
    if [ $status -ne 0 ]; then
        echo "FAILED!!! error_code="$status
        exit
    else
        END=$(date +%s);
        echo $((END-START)) | awk '{print "OK after "int($1/60)"m"int($1%60)"s"}'
        ITER=$((ITER + 1))
    fi
 done
