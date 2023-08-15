#!/bin/bash

## Write a shell script that takes arguments as a string of multiple words separated by spaces, and prints the words one per line.
### Приклад підставляння змінної в ім'я іншої

n=1

while [[ ${!n} ]]
    do
        echo ${!n}
        (( n++ ))
    done


