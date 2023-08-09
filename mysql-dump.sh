#!/bin/bash

# крон виконуватиме цей скрипт щогодини і видалятиме файли, старіші, ніж 3 години
# передаю дату і годину, коли зроблено дамп
# оскільки крон виконується від рута, пароль не потрібен

# cron:

#@reboot root sleep 60 && /bin/mysqldump wordpress > /home/yaroslav/backups/wordpress-dump-$(date +"\%Y-\%m-\%d_\%H_\%M").sql
#  0  */1  *  *  *  root /bin/mysqldump wordpress > /home/yaroslav/backups/wordpress-dump-$(date +"\%Y-\%m-\%d_\%H").sql
#  0  */3  *  *  *  root find /home/yaroslav/backups -name "*.sql" -type f -mmin +180 -delete

current_date=$(date +"%Y-%m-%d_%H_%M")
echo $current_date
mysqldump wordpress > data-dump-$current_date.sql