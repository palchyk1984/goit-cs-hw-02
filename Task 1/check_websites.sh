#!/bin/bash

# Визначаємо список URL
urls=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Файл для логів
log_file="website_status.log"

# Очистка файлу логів перед виконанням
> "$log_file"

# Перевірка кожного сайту
for url in "${urls[@]}"; do
    echo "Перевірка $url..."
    response=$(curl -s -o /dev/null -w "%{http_code}" $url)
    
    if [ "$response" -eq 200 ]; then
        echo "$url is UP"
        echo "$url is UP" >> "$log_file"
    else
        echo "$url is DOWN"
        echo "$url is DOWN" >> "$log_file"
    fi
done

# Виведення результатів
echo "Результати записано у файл логів: $log_file"
