#!/bin/bash

for i in $@; do 
    ssh-add ~/.ssh/$i
done
