# =================================================================
# SKRIP 4: ANALISIS KORELASI
# =================================================================
#
# TUJUAN:
# 1. Mengukur kekuatan dan arah hubungan linear antara dua variabel numerik.
# 2. Memvisualisasikan hubungan tersebut menggunakan scatter plot.
#
# METODE:
# 1. Koefisien Korelasi Pearson (jika data normal dan hubungannya linear).
# 2. Koefisien Korelasi Spearman (jika data tidak normal atau hubungannya monoton).
#
# INSTRUKSI:
# 1. Pastikan Anda sudah menjalankan skrip '01_data_preparation.R'.
# 2. Ganti 'variabel_x' dan 'variabel_y' dengan nama dua kolom numerik yang ingin Anda analisis.
# =================================================================

# -----------------------------------------------------------------
# Langkah 0: Persiapan
# -----------------------------------------------------------------
# Jika variabel 'data_bersih' belum ada, jalankan skrip 01 terlebih dahulu.
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

# Ganti dengan nama dua kolom numerik yang ingin Anda hubungkan.
# Contoh:
# var_x <- "luas_bangunan"
# var_y <- "harga_rumah"

var_x <- "Biaya_Akuisisi_Pelanggan_Juta_IDR" 
var_y <- "Nilai_Pelanggan_Juta_IDR"

# Pastikan kolom yang dipilih ada di dalam data
if(!var_x %in% names(data_bersih) || !var_y %in% names(data_bersih)) {
  stop(paste("Satu atau kedua kolom ('", var_x, "', '", var_y, "') tidak ditemukan. Periksa kembali nama kolom pada file 04_analisis_korelasi.R"))
}

# -----------------------------------------------------------------
# Langkah 1: Visualisasi Hubungan dengan Scatter Plot
# -----------------------------------------------------------------
# Scatter plot adalah cara terbaik untuk melihat pola hubungan antara dua variabel.
scatter_plot <- ggplot(data_bersih, aes_string(x = var_x, y = var_y)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") + # Menambah garis tren linear
  labs(
    title = paste("Scatter Plot antara", var_x, "dan", var_y),
    subtitle = "Garis merah menunjukkan tren linear",
    x = var_x,
    y = var_y
  ) +
  theme_minimal()

print(scatter_plot)

# Menyimpan scatter plot ke folder 'results'
ggsave(
  filename = paste0("../results/scatterplot_", var_x, "_vs_", var_y, ".png"),
  plot = scatter_plot,
  width = 8,
  height = 6
)
print(paste("Scatter plot disimpan di folder 'results'."))


# -----------------------------------------------------------------
# Langkah 2: Menghitung Koefisien Korelasi
# -----------------------------------------------------------------
# Koefisien korelasi (r) berkisar dari -1 hingga +1.
# - Mendekati +1: Korelasi positif kuat
# - Mendekati -1: Korelasi negatif kuat
# - Mendekati 0: Korelasi lemah atau tidak ada korelasi linear

# Uji korelasi memberikan koefisien (r) dan p-value.
# p-value menguji signifikansi korelasi.
# H0: Tidak ada korelasi (r = 0).
# H1: Ada korelasi (r != 0).
# Jika p-value <= 0.05, korelasi dianggap signifikan secara statistik.

# Pilih metode yang sesuai. 'pearson' adalah default dan umum digunakan.
# Gunakan 'spearman' jika data Anda tidak terdistribusi normal (berdasarkan skrip 03).
correlation_test <- cor.test(data_bersih[[var_x]], data_bersih[[var_y]], method = "pearson")

print(paste("--- Hasil Uji Korelasi antara", var_x, "dan", var_y, "---"))
print(correlation_test)

# Interpretasi otomatis
cor_value <- correlation_test$estimate
p_value <- correlation_test$p.value

print("--- Interpretasi Sederhana ---")
print(paste("Koefisien Korelasi (r) =", round(cor_value, 3)))

# Interpretasi kekuatan hubungan
if (abs(cor_value) >= 0.7) {
  strength <- "kuat"
} else if (abs(cor_value) >= 0.4) {
  strength <- "sedang"
} else if (abs(cor_value) >= 0.1) {
  strength <- "lemah"
} else {
  strength <- "sangat lemah atau tidak ada"
}

# Interpretasi arah hubungan
if (cor_value > 0) {
  direction <- "positif"
} else if (cor_value < 0) {
  direction <- "negatif"
} else {
  direction <- ""
}

print(paste("Ini menunjukkan adanya korelasi", direction, strength, "antara", var_x, "dan", var_y, "."))

# Interpretasi signifikansi
if (p_value <= 0.05) {
  print(paste("p-value =", round(p_value, 5), "adalah signifikan secara statistik (<= 0.05), sehingga kita yakin ada korelasi nyata di populasi."))
} else {
  print(paste("p-value =", round(p_value, 5), "tidak signifikan secara statistik (> 0.05), sehingga korelasi yang teramati bisa jadi hanya kebetulan."))
}

# Pesan akhir
print("Analisis korelasi selesai. Jangan lupa tulis interpretasi lengkap Anda di file README.md.")

