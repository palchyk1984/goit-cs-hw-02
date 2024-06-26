#!/bin/bash

# Визначення масиву з URL вебсайтів для перевірки
sites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Визначення назви файлу логів для зберігання результатів перевірки
logfile="website_status.log"

# Очищення файлу логів перед запуском скрипта, щоб результати були актуальними
> $logfile

# Функція для перевірки доступності кожного сайту
check_site() {
    # Виконання запиту HTTP HEAD для перевірки статусу сайту. Опції `curl`:
    # -s: Запустити "тихо", без виводу прогресу та помилок
    # -L: Дозволити перенаправлення
    # -A: Встановлення User-Agent для імітації запиту від реального браузера
    # --head: Виконати HEAD запит, що повертає тільки заголовки (швидше за GET)
    if curl -s --head  --request GET "$1" -L -A "Mozilla/5.0"; then 
        # Якщо `curl` завершується успішно, сайт вважається доступним
        echo "$1 is UP"
        echo "$1 is UP" >> $logfile
    else
        # Якщо `curl` завершується з помилкою, сайт вважається недоступним
        echo "$1 is DOWN"
        echo "$1 is DOWN" >> $logfile
    fi
}

# Перебір усіх сайтів з масиву та виклик функції перевірки для кожного
for site in "${sites[@]}"; do
    check_site $site
done

# Виведення повідомлення про те, що результати записано у файл логів
echo "Results have been written to $logfile"
