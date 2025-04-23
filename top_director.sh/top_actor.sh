
INPUT="main_dataset.csv"

# 1. Tìm đạo diễn có nhiều phim nhất

echo "📌 Tìm đạo diễn có nhiều phim nhất..."
echo "director,count" > top_director.csv

awk -F',' '
NR > 1 {
    gsub(/^ +| +$/, "", $10);  # Làm sạch khoảng trắng
    if ($10 != "") count[$10]++;
}
END {
    for (d in count) print d "," count[d];
}
' "$INPUT" | sort -t',' -k2,2nr | head -n 1 >> top_director.csv

# 2. Tìm diễn viên đóng nhiều phim nhất
echo "📌 Tìm diễn viên đóng nhiều phim nhất..."
echo "actor,count" > top_actor.csv

awk -F',' '
NR > 1 {
    gsub(/^ +| +$/, "", $9);
    n = split($9, actors, "|");  # Ngăn cách diễn viên bằng |
    for (i = 1; i <= n; i++) {
        gsub(/^ +| +$/, "", actors[i]);
        if (actors[i] != "") count[actors[i]]++;
    }
}
END {
    for (a in count) print a "," count[a];
}
' "$INPUT" | sort -t',' -k2,2nr | head -n 1 >> top_actor.csv

echo " Hoàn thành. Kết quả lưu ở: top_director.csv & top_actor.csv"
