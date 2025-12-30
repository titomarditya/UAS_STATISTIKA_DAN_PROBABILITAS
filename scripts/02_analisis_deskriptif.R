# =================================================================
# SKRIP 2: ANALISIS STATISTIK DESKRIPTIF
# =================================================================
#
# TUJUAN:
# 1. Menghitung ukuran pemusatan data (mean, median, modus).
# 2. Menghitung ukuran sebaran data (standar deviasi, range, kuartil).
# 3. Membuat visualisasi data (histogram dan boxplot) untuk memahami distribusi.
#
# INSTRUKSI:
# 1. Pastikan Anda sudah menjalankan skrip '01_data_preparation.R' terlebih dahulu.
# 2. Ganti 'nama_kolom_numerik' dengan nama kolom dari dataset Anda yang ingin dianalisis.
# 3. Simpan plot yang dihasilkan ke dalam folder 'results'.
# =================================================================

# -----------------------------------------------------------------
# Langkah 0: Persiapan
# -----------------------------------------------------------------
# Jika variabel 'data_bersih' belum ada, jalankan skrip 01 terlebih dahulu.
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

# Ganti dengan nama kolom numerik yang ingin Anda analisis dari dataset Anda.
# Contoh: kolom_analisis <- "harga_rumah"
kolom_analisis <- "Pendapatan_Tahunan_Miliar_IDR" 

# Pastikan kolom yang dipilih ada di dalam data
if(!kolom_analisis %in% names(data_bersih)) {
  stop(paste("Kolom '", kolom_analisis, "' tidak ditemukan dalam data. Silakan periksa kembali nama kolom pada file 02_analisis_deskriptif.R"))
}

# -----------------------------------------------------------------
# Langkah 1: Ukuran Pemusatan Data
# -----------------------------------------------------------------
# Mean (Rata-rata)
mean_value <- mean(data_bersih[[kolom_analisis]], na.rm = TRUE)
print(paste("Mean dari", kolom_analisis, ":", round(mean_value, 2)))

# Median (Nilai Tengah)
median_value <- median(data_bersih[[kolom_analisis]], na.rm = TRUE)
print(paste("Median dari", kolom_analisis, ":", round(median_value, 2)))

# Modus (Nilai yang Paling Sering Muncul)
# R tidak memiliki fungsi modus bawaan, jadi kita bisa membuatnya sendiri.
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode_value <- get_mode(data_bersih[[kolom_analisis]])
print(paste("Modus dari", kolom_analisis, ":", mode_value))


# -----------------------------------------------------------------
# Langkah 2: Ukuran Sebaran Data
# -----------------------------------------------------------------
# Standar Deviasi
sd_value <- sd(data_bersih[[kolom_analisis]], na.rm = TRUE)
print(paste("Standar Deviasi dari", kolom_analisis, ":", round(sd_value, 2)))

# Range (Jangkauan)
range_value <- range(data_bersih[[kolom_analisis]], na.rm = TRUE)
print(paste("Range dari", kolom_analisis, ":", range_value[1], "-", range_value[2]))

# Kuartil dan Ringkasan 5 Angka (Min, Q1, Median, Q3, Max)
summary_value <- summary(data_bersih[[kolom_analisis]])
print(paste("Ringkasan 5 Angka untuk", kolom_analisis, ":"))
print(summary_value)


# -----------------------------------------------------------------
# Langkah 3: Visualisasi Data
# -----------------------------------------------------------------
# A. Histogram
# Histogram membantu melihat bentuk distribusi data.
hist_plot <- ggplot(data_bersih, aes_string(x = kolom_analisis)) +
  geom_histogram(bins = 20, fill = "skyblue", color = "white") +
  geom_vline(aes(xintercept = mean_value), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = paste("Histogram dari", kolom_analisis),
    subtitle = paste("Garis merah putus-putus menunjukkan Mean =", round(mean_value, 2)),
    x = kolom_analisis,
    y = "Frekuensi"
  ) +
  theme_minimal()

print(hist_plot)

# Menyimpan histogram ke folder 'results'
ggsave(
  filename = paste0("../results/histogram_", kolom_analisis, ".png"),
  plot = hist_plot,
  width = 8,
  height = 6
)
print(paste("Histogram disimpan di folder 'results' dengan nama histogram_", kolom_analisis, ".png", sep=""))


# B. Boxplot
# Boxplot berguna untuk mengidentifikasi pencilan (outliers) dan melihat sebaran kuartil.
box_plot <- ggplot(data_bersih, aes_string(y = kolom_analisis)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(
    title = paste("Boxplot dari", kolom_analisis),
    y = kolom_analisis
  ) +
  theme_minimal()

print(box_plot)

# Menyimpan boxplot ke folder 'results'
ggsave(
  filename = paste0("../results/boxplot_", kolom_analisis, ".png"),
  plot = box_plot,
  width = 6,
  height = 8
)
print(paste("Boxplot disimpan di folder 'results' dengan nama boxplot_", kolom_analisis, ".png", sep=""))

# Pesan akhir
print("Analisis deskriptif selesai. Jangan lupa untuk menginterpretasikan hasilnya di file README.md.")

