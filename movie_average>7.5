# Tạo file đầu ra và ghi dòng tiêu đề
printf "id,original_title,vote_average\n" > rated_abv_dataset.csv

# Duyệt từng dòng (trừ tiêu đề), lọc theo điều kiện, in ra các cột tương ứng
awk -F',' '
NR > 1 && $18 ~ /^[0-9.]+$/ {
    if ($18 + 0 > 7.5)
        print $1 "," $6 "," $18
}' main_dataset.csv | sort -t',' -k3,3gr >> rated_abv_dataset.csv
