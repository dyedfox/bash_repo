#!/bin/bash

#awk '/^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}\s[0,1][1-9]\/[2,3][0-9]$/ {print $0}' - пошук збігів

# regex = ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$


#Правильний вираз IP44! - echo "612.122.203.4" | awk '/^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/ {print $0}'
# Правильний вираз IPv4 через grep - echo "192.22.11.2" | grep -E '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$'


#IPv6 echo "2001:0db8::8a2e:0370:7334" | awk '/^(([0-9A-Fa-f]{1,4}:){6}|(::([0-9A-Fa-f]{1,4}:){0,5})|(([0-9A-Fa-f]{1,4}:){1,5}:)|(([0-9A-Fa-f]{1,4}:){2,4}:)|(([0-9A-Fa-f]{1,4}:){3,3}:)|(([0-9A-Fa-f]{1,4}:){4,2}:)|(([0-9A-Fa-f]{1,4}:){5,1}:)|(::))([0-9A-Fa-f]{1,4})$/ {print $0}'
# цей вираз правильний з точки зору регулярних виразів, але awk його не сприймає через - Awk's regular expression implementation may not support some advanced features, such as non-capturing groups and repetition with variable ranges.

# echo "2001:0db8::8a2e:0370:7334" | grep -E "^(([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4}|([0-9A-Fa-f]{1,4}:){1,6}(:[0-9A-Fa-f]{1,4}){1,6})$"
# не враховує скорочені нулі, але ...

check="null"
if [[ $(echo $1 | awk '/^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/ {print $0}') ]]
    then
        echo "$1 looks like an IPv4 IP address"
        check="ipv4"
    elif [[ $check = "null" ]]
        then
        check="ipv6"
        check=$(echo $1 | awk -F ":" '{ for (i=1; i<=NF; i++) { if ($i ~ /^[0-9A-Fa-f]{1,4}$/) next; else { print "null"; exit } } print "ipv6" }')
        if [ "$check" = "ipv6" ]
        then
            echo "$1 could be an IPv6 IP address."
        fi
    else
        echo "$1 is no neither valid IPv4 address nor valid IPv6 address"
fi