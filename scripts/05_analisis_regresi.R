# =================================================================
# SKRIP 5: ANALISIS REGRESI LINEAR SEDERHANA
# =================================================================
#
# TUJUAN:
# 1. Membuat model prediksi sederhana untuk satu variabel dependen (Y)
#    berdasarkan satu variabel independen (X).
# 2. Menginterpretasikan koefisien model (intercept dan slope).
# 3. Mengevaluasi seberapa baik model tersebut (R-squared).
#
# INSTRUKSI:
# 1. Pastikan Anda sudah menjalankan skrip '01_data_preparation.R'.
# 2. Tentukan mana 'variabel_dependen' (Y, yang ingin diprediksi) dan
#    'variabel_independen' (X, sebagai prediktor).
# 3. Biasanya, variabel ini sama dengan yang digunakan dalam analisis korelasi.
# =================================================================

# -----------------------------------------------------------------
# Langkah 0: Persiapan
# -----------------------------------------------------------------
# Jika variabel 'data_bersih' belum ada, jalankan skrip 01 terlebih dahulu.
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

# Tentukan variabel dependen (Y) dan independen (X).
# Y adalah variabel yang ingin Anda prediksi.
# X adalah variabel yang Anda gunakan untuk memprediksi.
# Contoh:
# var_dependen <- "harga_rumah"
# var_independen <- "luas_bangunan"

var_dependen <- "Biaya_Akuisisi_Pelanggan_Juta_IDR"   # Seringkali sama dengan var_y dari skrip korelasi
var_independen <- "Nilai_Pelanggan_Juta_IDR" # Seringkali sama dengan var_x dari skrip korelasi

# Pastikan kolom yang dipilih ada di dalam data
if(!var_dependen %in% names(data_bersih) || !var_independen %in% names(data_bersih)) {
  stop(paste("Satu atau kedua kolom ('", var_dependen, "', '", var_independen, "') tidak ditemukan. Periksa kembali nama kolom pada file 05_analisis_regresi.R"))
}

# -----------------------------------------------------------------
# Langkah 1: Membangun Model Regresi Linear
# -----------------------------------------------------------------
# Fungsi lm() (linear model) digunakan untuk membuat model regresi.
# Formula `Y ~ X` dibaca "Y diprediksi oleh X".

model_regresi <- lm(as.formula(paste(var_dependen, "~", var_independen)), data = data_bersih)


# -----------------------------------------------------------------
# Langkah 2: Melihat dan Menginterpretasikan Hasil Model
# -----------------------------------------------------------------
# Fungsi summary() memberikan output yang sangat kaya informasi.
summary_model <- summary(model_regresi)

print("--- Ringkasan Model Regresi Linear ---")
print(summary_model)

print("--- Interpretasi Penting dari Model ---")

# A. Koefisien (Coefficients)
# - (Intercept): Nilai Y ketika X = 0.
# - [nama var_independen]: Slope, atau perubahan pada Y untuk setiap kenaikan 1 unit pada X.
# - Pr(>|t|): p-value untuk koefisien. Jika <= 0.05, artinya variabel independen signifikan secara statistik dalam memprediksi variabel dependen.

intercept_val <- coef(model_regresi)[1]
slope_val <- coef(model_regresi)[2]

print(paste("1. Persamaan Model: ", var_dependen, " = ", round(intercept_val, 2), " + ", round(slope_val, 2), " * ", var_independen))
print(paste("   - Intercept (b0) =", round(intercept_val, 2), "-> Nilai prediksi", var_dependen, "ketika", var_independen, "adalah 0."))
print(paste("   - Slope (b1) =", round(slope_val, 2), "-> Setiap kenaikan 1 unit pada", var_independen, ", diprediksi akan mengubah", var_dependen, "sebesar", round(slope_val, 2), "unit."))

# B. R-squared (Koefisien Determinasi)
# - Adjusted R-squared: Persentase variasi dalam variabel dependen (Y) yang dapat
#   dijelaskan oleh variabel independen (X) dalam model ini.
# - Nilainya berkisar dari 0 hingga 1 (atau 0% hingga 100%).

adj_r_squared <- summary_model$adj.r.squared
print(paste("2. Adjusted R-squared =", round(adj_r_squared, 3), "atau", round(adj_r_squared * 100, 1), "%" ))
print(paste("   - Artinya,", round(adj_r_squared * 100, 1), "% variasi pada", var_dependen, "dapat dijelaskan oleh", var_independen, "melalui model ini."))


# -----------------------------------------------------------------
# Langkah 3: Visualisasi Garis Regresi
# -----------------------------------------------------------------
# Kita bisa menggunakan scatter plot dari skrip sebelumnya dan menambahkan garis regresi dari model ini.
# Garis ini adalah representasi visual dari persamaan model kita.

plot_regresi <- ggplot(data_bersih, aes_string(x = var_independen, y = var_dependen)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") + # `se = TRUE` menampilkan confidence interval
  labs(
    title = "Garis Regresi Linear",
    subtitle = paste0(
      "Model: ", var_dependen, " ~ ", var_independen, "\n",
      "Adj. R-squared = ", round(adj_r_squared, 3)
    ),
    x = var_independen,
    y = var_dependen
  ) +
  theme_minimal()

print(plot_regresi)

# Menyimpan plot regresi ke folder 'results'
ggsave(
  filename = paste0("../results/plot_regresi_", var_independen, "_vs_", var_dependen, ".png"),
  plot = plot_regresi,
  width = 8,
  height = 6
)
print(paste("Plot regresi disimpan di folder 'results'."))

# Pesan akhir
print("Analisis regresi selesai. Ini adalah dasar dari pemodelan prediktif. Jangan lupa tulis interpretasi Anda di README.md.")

