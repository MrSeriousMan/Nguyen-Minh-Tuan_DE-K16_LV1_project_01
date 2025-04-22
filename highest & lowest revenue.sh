#!/bin/bash
#-----How to run code-----#

#----- chmod +x revenue_extremes.sh     -----#
#-----        ./revenue_extremes.sh     -----#

# Tạo file kết quả
printf "original_title,revenue\n" > zero_revenue.csv
printf "original_title,revenue\n" > max_revenue.csv

# Xử lý cả hai trong một lượt đọc file
awk -F',' '
NR == 2 {
    min = max = $5
    min_rows[NR] = $0
    max_rows[NR] = $0
    next
}
NR > 2 {
    if ($5 == min) {
        min_rows[NR] = $0
    } else if ($5 < min) {
        delete min_rows
        min = $5
        min_rows[NR] = $0
    }

    if ($5 == max) {
        max_rows[NR] = $0
    } else if ($5 > max) {
        delete max_rows
        max = $5
        max_rows[NR] = $0
    }
}
END {
    for (i in min_rows) {
        split(min_rows[i], f, ",")
        print f[6] "," f[5] >> "zero_revenue.csv"
    }
    for (j in max_rows) {
        split(max_rows[j], f, ",")
        print f[6] "," f[5] >> "max_revenue.csv"
    }
}
' main_dataset.csv
