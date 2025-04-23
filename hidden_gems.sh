echo "original_title,vote_average,revenue" > hidden_gems.csv

awk -F',' 'NR > 1 && $18 >= 8 && $5 < 10000000 { print $6","$18","$5 }' main_dataset.csv \
| sort -t',' -k2,2nr | head -n 10 >> hidden_gems.csv
