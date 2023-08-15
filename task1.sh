#!/bin/bash

### Suppose we have a text file that contains some file names, for example:
### jobe
### /var/www/html/index.html
### /var/www/html/jobe
### Write a shell script that takes the name of such a text file as an argument and shows its content

cat $1
#для переходу на новий рядок
echo

#хотів додати перевірку на те, чи аргумент є файлом чи чи взагалі існує, але bash сам це перевіряє і виводить повідомлення
#cat: README.m: Немає такого файла або каталогу
#yaroslav@fedora-dell:~/python/handy_sh$ ./task1.sh .git
#cat: .git: Є каталогом