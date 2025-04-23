#!/bin/bash

# File đầu vào
INPUT="main_dataset.csv"

# Ghi header file đầu ra
echo "genre,count" > genre_stats.csv

# Thống kê thể loại
awk -F',' '
NR > 1 {
    gsub(/^ +| +$/, "", $4);  # Xóa khoảng trắng đầu/cuối
    n = split($4, genres, "|");  # Tách các thể loại (dấu |)
    for (i = 1; i <= n; i++) {
        gsub(/^ +| +$/, "", genres[i]);
        if (genres[i] != "") count[genres[i]]++;
    }
}
END {
    for (g in count) print g "," count[g];
}
' "$INPUT" | sort -t',' -k2,2nr >> genre_stats.csv

# Thông báo kết thúc
echo " File kết quả: genre_stats.csv"
