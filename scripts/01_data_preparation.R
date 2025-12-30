# =================================================================
# SKRIP 1: PERSIAPAN DATA
# =================================================================
#
# TUJUAN:
# 1. Memuat library/paket yang dibutuhkan.
# 2. Memuat dataset dari folder 'data'.
# 3. Memeriksa struktur dan ringkasan awal data.
# 4. Membersihkan data (jika diperlukan).
#
# INSTRUKSI:
# 1. Ganti 'nama_file_data.csv' dengan nama file dataset Anda.
# 2. Jalankan setiap baris kode satu per satu (Ctrl+Enter atau Cmd+Enter).
# 3. Perhatikan output di konsol untuk memahami data Anda.
# =================================================================

# -----------------------------------------------------------------
# Langkah 1: Memuat Library
# -----------------------------------------------------------------
# 'tidyverse' adalah kumpulan paket R yang sangat berguna untuk manipulasi dan visualisasi data.
# Jika Anda belum menginstalnya, hapus tanda '#' di bawah dan jalankan.
# install.packages("tidyverse")

library(tidyverse)

# -----------------------------------------------------------------
# Langkah 2: Memuat Dataset
# -----------------------------------------------------------------
# Pastikan dataset Anda sudah berada di dalam folder 'data'.
# Ganti "nama_file_data.csv" dengan nama file Anda.
# Fungsi read_csv() berasal dari paket 'readr' (bagian dari tidyverse).

tryCatch({
  # Ganti nama file di bawah ini
  file_path <- "data/data_startup_saas.csv"
  data <- read_csv(file_path)
  
  # Pesan jika berhasil
  print(paste("Dataset berhasil dimuat dari:", file_path))
  
}, error = function(e) {
  # Pesan jika gagal (misalnya, file tidak ditemukan)
  print("Gagal memuat dataset. Pastikan nama file dan lokasinya sudah benar di dalam folder 'data'.")
  print(e)
})


# -----------------------------------------------------------------
# Langkah 3: Pemeriksaan Awal Data
# -----------------------------------------------------------------
# Periksa beberapa baris pertama data untuk memastikan data termuat dengan benar.
print("Menampilkan 6 baris pertama data:")
print(head(data))

# Lihat struktur data: nama kolom, tipe data (numerik, karakter, dll.), dan jumlah observasi.
print("Menampilkan struktur data:")
glimpse(data)

# Dapatkan ringkasan statistik dasar untuk setiap kolom (terutama kolom numerik).
print("Menampilkan ringkasan statistik data:")
summary(data)


# -----------------------------------------------------------------
# Langkah 4: Pembersihan Data (Opsional, tapi sangat direkomendasikan)
# -----------------------------------------------------------------
# Cek apakah ada nilai yang hilang (missing values) di setiap kolom.
print("Jumlah missing values per kolom:")
print(colSums(is.na(data)))

# Jika ada missing values, Anda harus memutuskan cara menanganinya.
# Opsi 1: Hapus baris yang mengandung missing value (gunakan dengan hati-hati).
# data_bersih <- na.omit(data)

# Opsi 2: Isi missing value dengan nilai tertentu (misalnya, mean atau median).
# Ganti 'nama_kolom' dengan kolom yang ingin Anda isi.
# data_bersih <- data %>%
#   mutate(nama_kolom = ifelse(is.na(nama_kolom), mean(nama_kolom, na.rm = TRUE), nama_kolom))

# Untuk saat ini, kita akan menganggap data sudah bersih dan menggunakan dataset asli.
# Jika Anda melakukan pembersihan, gunakan variabel 'data_bersih' untuk analisis selanjutnya.
data_bersih <- data

# Pesan akhir
print("Persiapan data selesai. Variabel 'data_bersih' siap digunakan untuk analisis selanjutnya.")

