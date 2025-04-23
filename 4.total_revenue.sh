awk -F',' '
BEGIN {
    total = 0;
}
NR > 1 && $5 ~ /^[0-9]+$/ {
    total += $5;
}
END {
    print "   Tổng doanh thu của tất cả các phim"    >> "single_output.txt";
    printf "   Tổng: $%,d\n", total                  >> "single_output.txt";
  
}' main_dataset.csv
