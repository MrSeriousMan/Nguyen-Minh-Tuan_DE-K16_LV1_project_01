# Ghi header
echo "id,original_title,profit" > top_ten_profit.csv

# Tính lợi nhuận, sắp xếp giảm dần, lấy top 10
awk -F',' 'NR > 1 && $5 ~ /^[0-9]+$/ && $6 ~ /^[0-9]+$/ {
    profit = $5 - $6;
    print $1 "," $6 "," profit
}' main_dataset.csv | sort -t',' -k3,3nr | head -n 10 >> top_ten_profit.csv
