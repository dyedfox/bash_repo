#!/bin/bash

### ADDITIONAL TASK 1 - Please write tests that determine whether the value of variables is in the proper format for an IPv4 and IPv6 address 
### and print "Could be an IPv6 IP address" or "Looks like an IPv4 IP address"


# awk '/^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}\s[0,1][1-9]\/[2,3][0-9]$/ {print $0}' - пошук збігів

# regex = ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$


#Правильний вираз IP44! - echo "612.122.203.4" | awk '/^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/ {print $0}'
# Правильний вираз IPv4 через grep - echo "192.22.11.2" | grep -E '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$'


#IPv6 echo "2001:0db8::8a2e:0370:7334" | awk '/^(([0-9A-Fa-f]{1,4}:){6}|(::([0-9A-Fa-f]{1,4}:){0,5})|(([0-9A-Fa-f]{1,4}:){1,5}:)|(([0-9A-Fa-f]{1,4}:){2,4}:)|(([0-9A-Fa-f]{1,4}:){3,3}:)|(([0-9A-Fa-f]{1,4}:){4,2}:)|(([0-9A-Fa-f]{1,4}:){5,1}:)|(::))([0-9A-Fa-f]{1,4})$/ {print $0}'
# цей вираз правильний з точки зору регулярних виразів, але awk його не сприймає через - Awk's regular expression implementation may not support some advanced features, such as non-capturing groups and repetition with variable ranges.

# echo "2001:0db8::8a2e:0370:7334" | grep -E "^(([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4}|([0-9A-Fa-f]{1,4}:){1,6}(:[0-9A-Fa-f]{1,4}){1,6})$"
# не враховує скорочені нулі, але ...

if [[ $(echo $1 | grep -E '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$') ]]
    then
        echo "Looks like an IPv4 IP address"
    elif [[ $(echo $1 | grep -E "^(([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4}|([0-9A-Fa-f]{1,4}:){1,6}(:[0-9A-Fa-f]{1,4}){1,6})$") ]] 
    then
        echo "Could be an IPv6 IP address"
    else
        echo "Neither valid IPv4 address nor valid IPv6 address"
fi