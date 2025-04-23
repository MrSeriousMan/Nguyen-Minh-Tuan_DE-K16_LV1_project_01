# movies-data-analysis
## 1🎬 Movie Dataset Analysis – Bash Scripting Project

This project uses Bash scripting to process and analyze a real-world movie dataset from TMDB.  
The dataset includes information about titles, genres, ratings, revenue, and more.

## 2.📁 Dataset

The dataset is downloaded from GitHub and preprocessed to ensure clean, consistent CSV formatting.

Download link:
```bash
curl https://raw.githubusercontent.com/yinghaoz1/tmdb-movie-dataset-analysis/master/tmdb-movies.csv -o movie_dataset.csv
---

###  3.⚙️ **Hướng dẫn chạy script**

```md
## ⚙️ How to run

```bash
bash clean_data.sh
bash analyze_top10.sh
bash analyze_genre.sh
bash analyze_ratings_directors.sh


---

### 4. 📊 **Các phân tích đã thực hiện**

```md
## 📊 Phân tích dữ liệu

- ✅ Sắp xếp phim theo ngày phát hành giảm dần
- ✅ Lọc phim có đánh giá > 7.5
- ✅ Phim có doanh thu cao nhất / thấp nhất
- ✅ Tính tổng doanh thu tất cả phim
- ✅ Top 10 phim doanh thu cao nhất
- ✅ Đạo diễn và diễn viên có nhiều phim nhất
- ✅ Thống kê số lượng phim theo thể loại
- ✅ Phân tích trung bình điểm đánh giá theo thể loại
- ✅ Top phim có điểm cao nhưng doanh thu thấp ("hidden gems")


