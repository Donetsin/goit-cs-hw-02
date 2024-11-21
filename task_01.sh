#!/bin/bash

# Список вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com" "http://notreal.site")

# Назва файлу логів
log_file="website_status.log"

# Очищення файлу логів перед початком перевірки
> "$log_file"

for site in "${websites[@]}"; do
    status=$(curl -L -s -o /dev/null -w "%{http_code}" "$site")
    
    if [ "$status" -eq 200 ]; then
        result="$site is UP"
    else
        result="$site is DOWN (HTTP status: $status)"
    fi
    
    echo "$result" >> "$log_file"
done

echo -e "\033[34mРезультати перевірки записано у файл:\033[0m \033[33m$log_file\033[0m"