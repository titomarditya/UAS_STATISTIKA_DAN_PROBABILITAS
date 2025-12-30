# UAS_STATISTIKA_DAN_PROBABILITAS
# Tugas Analisis Statistik: Deskriptif, Korelasi, dan Regresi

## 1. Informasi Penyusun

- **Nama:** `[KADEK TITO MARDITYA PUTRA]`
- **NIM:** `[2515091104]`
- **Program Studi:** `[SISTEM INFORMASI]`
- **Mata Kuliah:** Statistika dan Probabilitas

---

## 2. Deskripsi Proyek

Dataset yang digunakan adalah data data_startup_saas.csv yang berisi informasi tentang karakteristik dan kinerja bisnis startup SaaS. Variabel kunci dalam dataset ini meliputi Pendapatan_Tahunan_Miliar_IDR, Biaya_Akuisisi_Pelanggan_Juta_IDR, dan Nilai_Pelanggan_Juta_IDR. Tujuan dari proyek ini adalah untuk memahami karakteristik data melalui analisis statistik deskriptif, menguji hubungan antara Biaya_Akuisisi_Pelanggan_Juta_IDR dan Nilai_Pelanggan_Juta_IDR melalui analisis korelasi, serta memprediksi Biaya_Akuisisi_Pelanggan_Juta_IDR menggunakan Nilai_Pelanggan_Juta_IDR sebagai prediktor melalui analisis regresi linear.
*Contoh:*


---

## 3. Struktur Proyek

Proyek ini diorganisir ke dalam beberapa folder:
- `/data`: Berisi dataset mentah yang digunakan untuk analisis.
- `/scripts`: Berisi semua skrip R yang digunakan dalam analisis, diurutkan berdasarkan alur kerja.
- `/results`: Berisi output dari analisis, seperti plot, gambar, atau tabel ringkasan.

---

## 4. Cara Menjalankan Analisis

Untuk mereproduksi hasil analisis ini, ikuti langkah-langkah berikut:
1. Pastikan Anda memiliki R dan RStudio terinstal.
2. Buka proyek R ini di RStudio.
3. Instal paket yang diperlukan dengan menjalankan perintah berikut di konsol R:
   ```R
   # install.packages(c("tidyverse", "corrplot", "knitr"))
   ```
4. Jalankan skrip di dalam folder `/scripts` secara berurutan, mulai dari `01_data_preparation.R` hingga `05_analisis_regresi.R`.

---

## 5. Hasil dan Interpretasi

Di bagian ini, mahasiswa diharapkan untuk menyajikan dan menginterpretasikan hasil dari setiap tahap analisis.

### 5.1. Statistik Deskriptif
- **Ukuran Pemusatan (Mean, Median, Modus):**
  - *Tabel atau ringkasan...*
  	Mean	31.88
  	Median	31.30
  	Modus	1.87
	

  - *Interpretasi:* Jelaskan apa arti dari nilai-nilai tersebut terkait dengan data Anda.
- **Ukuran Sebaran (Standar Deviasi, Range, Kuartil):**
  - *Tabel atau ringkasan...*
  Tabel Ukuran Sebaran Pendapatan Tahunan
Ukuran Sebaran	Nilai
Standar Deviasi	19.79
Minimum	1.00
Kuartil 1 (Q1)	14.31
Median (Q2)	31.30
Kuartil 3 (Q3)	49.04
Maximum	66.89
Ringkasan Interpretasi

Standar deviasi yang cukup besar menunjukkan bahwa pendapatan tahunan startup SaaS memiliki variasi yang tinggi. Nilai minimum dan maksimum yang berjauhan menunjukkan perbedaan pendapatan yang besar antar startup. Berdasarkan kuartil, sebagian besar data berada pada rentang pendapatan menengah, sehingga data tidak terkonsentrasi pada satu nilai tertentu.

  - *Interpretasi:* Jelaskan seberapa menyebar data Anda berdasarkan nilai-nilai ini.
- **Visualisasi (Histogram/Boxplot):**
  - *Sematkan gambar plot dari folder /results...*
  ![Histogram Pendapatan Tahunan](results/histogram_Pendapatan_Tahunan_Miliar_IDR.png)
  - *Interpretasi:* Jelaskan wawasan apa yang Anda dapatkan dari bentuk distribusi data.
Histogram menunjukkan bahwa pendapatan tahunan startup SaaS tersebar luas dari nilai rendah hingga tinggi. Garis mean sebesar 31,88 miliar IDR berada di tengah sebaran data, menandakan bahwa rata-rata pendapatan berada pada kisaran menengah. Distribusi data tidak terkonsentrasi pada satu nilai tertentu, sehingga menunjukkan variasi pendapatan yang cukup besar antar startup.
### 5.2. Uji Normalitas
- **Hasil Uji Shapiro-Wilk:**
  - *Nilai p-value...*
  0,01
  - *Interpretasi:* Apakah data Anda terdistribusi normal berdasarkan hasil uji? Apa implikasinya?
  Nilai p-value uji Shapiro–Wilk sebesar 1.497 × 10⁻¹⁴, lebih kecil dari 0.05, sehingga data tidak terdistribusi normal.
- **Plot Q-Q:**
  - *Sematkan gambar plot dari folder /results...*
  ![Q-Q Plot Pendapatan Tahunan](results/qqplot_Pendapatan_Tahunan_Miliar_IDR.png)
  - *Interpretasi:* Apakah titik-titik data mengikuti garis lurus? Apa artinya?
Titik-titik data pada Q-Q plot tidak sepenuhnya mengikuti garis lurus. Hal ini menunjukkan bahwa data tidak berdistribusi normal, sehingga terdapat penyimpangan dari distribusi normal teoretis.
### 5.3. Analisis Korelasi
- **Nilai Koefisien Korelasi:**
  - *Nilai r...*
r: 0.999
  - *Interpretasi:* Seberapa kuat dan apa arah hubungan antara dua variabel yang Anda uji? (misalnya, korelasi positif kuat, negatif lemah, atau tidak ada korelasi).
  Nilai koefisien korelasi sebesar 0.999 menunjukkan adanya hubungan positif yang sangat kuat antara Biaya_Akuisisi_Pelanggan_Juta_IDR dan Nilai_Pelanggan_Juta_IDR. Artinya, ketika nilai pelanggan meningkat, biaya akuisisi pelanggan juga cenderung meningkat.
- **Visualisasi (Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...*
![Scatter Plot Biaya Akuisisi vs Nilai Pelanggan](results/scatterplot_Biaya_Akuisisi_Pelanggan_Juta_IDR_vs_Nilai_Pelanggan_Juta_IDR.png)
  - *Interpretasi:* Apakah pola pada scatter plot mendukung hasil koefisien korelasi?
Scatter plot menunjukkan pola titik-titik yang membentuk garis naik dari kiri ke kanan. Pola ini mendukung hasil koefisien korelasi yang menunjukkan hubungan positif yang sangat kuat antara biaya akuisisi pelanggan dan nilai pelanggan.
### 5.4. Analisis Regresi
- **Model Regresi:**
  - *Persamaan regresi: Y = b0 + b1*X*
Y=0.14+0.33X
  - *Interpretasi:* Jelaskan arti dari koefisien intercept (b0) dan slope (b1) dalam konteks data Anda.
Y = Biaya_Akuisisi_Pelanggan_Juta_IDR
X = Nilai_Pelanggan_Juta_IDR
Intercept (b₀ = 0.14) menunjukkan perkiraan biaya akuisisi pelanggan ketika nilai pelanggan bernilai nol.
Slope (b₁ = 0.33) menunjukkan bahwa setiap kenaikan 1 juta IDR nilai pelanggan akan meningkatkan biaya akuisisi pelanggan sebesar 0.33 juta IDR.
- **Evaluasi Model (R-squared):**
  - *Nilai R-squared...*
R-squared: 0.999
  - *Interpretasi:* Berapa persen variasi dari variabel dependen yang dapat dijelaskan oleh model regresi Anda?
Nilai R-squared sebesar 0.999 menunjukkan bahwa sekitar 99.9% variasi Biaya_Akuisisi_Pelanggan_Juta_IDR dapat dijelaskan oleh Nilai_Pelanggan_Juta_IDR dalam model regresi. Hal ini menunjukkan bahwa model memiliki kemampuan penjelasan yang sangat tinggi terhadap data.
- **Visualisasi (Garis Regresi pada Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...*
![Plot Regresi Nilai Pelanggan vs Biaya Akuisisi](results/plot_regresi_Nilai_Pelanggan_Juta_IDR_vs_Biaya_Akuisisi_Pelanggan_Juta_IDR.png)
  - *Interpretasi:* Jelaskan bagaimana garis regresi merepresentasikan hubungan antara variabel.
Garis regresi menunjukkan hubungan linear positif, di mana peningkatan nilai pelanggan diikuti oleh peningkatan biaya akuisisi pelanggan.

---

## 6. Kesimpulan

Rangkum temuan utama dari analisis Anda dalam beberapa kalimat. Apa wawasan paling penting yang Anda peroleh?
Berdasarkan hasil analisis yang dilakukan, pendapatan tahunan startup SaaS menunjukkan variasi yang cukup besar dan tidak terdistribusi normal. Analisis korelasi menunjukkan adanya hubungan positif yang sangat kuat antara biaya akuisisi pelanggan dan nilai pelanggan. Hasil regresi linear menunjukkan bahwa nilai pelanggan berpengaruh signifikan terhadap biaya akuisisi pelanggan, dengan kemampuan penjelasan model yang sangat tinggi.

