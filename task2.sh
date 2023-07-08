#!/bin/bash

n=1

while [[ ${!n} ]]
    do
        echo ${!n}
        (( n++ ))
    done


