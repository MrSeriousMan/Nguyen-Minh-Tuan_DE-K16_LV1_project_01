#!/bin/bash

# Step 1: Download dataset
curl https://raw.githubusercontent.com/yinghaoz1/tmdb-movie-dataset-analysis/master/tmdb-movies.csv -o movie_dataset.csv

# Step 2: Backup
mkdir -p backup
cp movie_dataset.csv backup/backup_dataset.csv

# Step 3: Set locale (for sorting numbers)
export LC_NUMERIC=en_US.UTF-8

# Step 4: Extract header
head -n 1 movie_dataset.csv > header.csv

# Step 5: Fix line breaks inside quotes
awk 'BEGIN { ORS=""; inside=0 }
{
    if (inside) {
        printf "\\n%s", $0;
    } else {
        printf "%s", $0;
    }

    if (gsub(/"/, "&") % 2 == 1) {
        if (inside == 0) {
            inside = 1;
        } else {
            inside = 0;
            print "\n";
        }
    } else if (!inside) {
        print "\n";
    }
}' movie_dataset.csv > main_dataset.csv

# Step 6:  Replace commas inside quoted strings with ~
awk -F'"' 'BEGIN {ORS="";}
{
    if(NF == 0) printf("%s\n", $0);
    for (i=1; i<=NF; i++)
    {
        if(i % 2 == 0)
        {
            gsub(/,/, "~", $i);
            printf("%s", $i);
        }
        else printf("%s", $i);
    }
    printf("\n");
}' main_dataset.csv > temp_dataset.csv

# Step 7: Trim whitespace in some columns
awk -F',' 'BEGIN {OFS = ","} {
    gsub(/^[ \t]+|[ \t]+$/, "", $7);
    gsub(/^[ \t]+|[ \t]+$/, "", $9);
    gsub(/^[ \t]+|[ \t]+$/, "", $14);
    print $0;
}' temp_dataset.csv > main_dataset.csv

# Step 8: Sort by release_date (column 10), descending
# Extract header
head -n 1 main_dataset.csv > sorted_dataset.csv

# Sort data (ignore header)
tail -n +2 main_dataset.csv | sort -t',' -k10,10r >> sorted_dataset.csv


#---- Bonus file: sort_by_release_date.py (trong trường hợp step 8 chạy không đúng kết quả theo thứ tự giảm dần của release_date) ----#
import csv
from datetime import datetime

with open('main_dataset.csv', 'r', encoding='utf-8') as f:
    reader = csv.reader(f)
    header = next(reader)
    data = []

    for row in reader:
        try:
            # Giả sử release_date là cột thứ 10 (index 9)
            date_str = row[9].strip()
            if date_str:
                date_obj = datetime.strptime(date_str, "%Y-%m-%d")
            else:
                date_obj = datetime.min  # nếu rỗng thì đẩy xuống cuối
            data.append((date_obj, row))
        except Exception:
            data.append((datetime.min, row))  # xử lý lỗi định dạng

# Sắp xếp theo thời gian giảm dần
data.sort(key=lambda x: x[0], reverse=True)

# Ghi ra file mới
with open('sorted_dataset.csv', 'w', newline='', encoding='utf-8') as f:
    writer = csv.writer(f)
    writer.writerow(header)
    for _, row in data:
        writer.writerow(row)
        
# Run command
  python3 sort_by_release_date.py


