# 🛒 Aplikasi Kasir – Sistem Point of Sales Berbasis Web

Aplikasi Kasir (Point of Sales) efisien dan elegan yang khusus dikembangkan menggunakan **PHP Native** dan **Vanilla CSS3** untuk memenuhi Uji Kompetensi Keahlian (UKK) jurusan Rekayasa Perangkat Lunak (RPL) Paket 4.

---

## ✨ Fitur Utama

### 🌐 Halaman Publik (Autentikasi)

- Form Login Multi-Level (Administrator & Petugas Kasir).
- Sistem Autentikasi Cerdas dengan standar enkripsi Hash Bcrypt (`password_hash`).
- Auto-migrasi password _plaintext_ ke dalam _hash_ secara otomatis untuk akun tipe lama.

### 🔐 Dashboard Admin / Petugas

- **Transaksi Kasir Real-Time**: Input banyak produk sekaligus pada satu tagihan (keranjang dinamis) beserta perhitungan total serentak.
- **Manajemen Produk & Stok**: Pendataan master barang, peringatan saat stok sudah mulai menipis (<10 barang), serta pemotongan stok berantai setelah penjualan tersimpan.
- **Manajemen Pelanggan**: Registrasi dan penyuntingan daftar konsumen setia yang akan terhubung dengan fitur Transaksi.
- **Laporan Penjualan**: Rekapitulasi omzet yang bisa difilter berdasarkan custom tanggal dan sudah didukung fasilitas tombol Cetak (_Print-ready_).
- **Super-Admin User Management**: Operasi CRUD akun khusus hak akses Administrator.

---

## 🛠️ Teknologi yang Digunakan

- **Backend**: PHP 8 (OOP & Procedural Hybrid)
- **Database**: MySQL / MariaDB (via konektor `mysqli`)
- **Frontend**: Vanilla CSS3 (Custom Variables) dan HTML5 Semantic
- **Library Tambahan**: [Phosphor Icons](https://phosphoricons.com/) untuk grafis ikonik dan modern

---

## 🗃️ Struktur Database

- **`users`** – Tabel untuk data kredensial login pegawai (petugas kasir / administrator) dengan proteksi _password_.
- **`produk`** – Berisi katalog master semua jenis barang dagangan beserta harga jual dan jumlah _inventory_.
- **`pelanggan`** – Relasi data informasi daftar nama, alamat, serta telepon dari para pembeli/konsumen reguler.
- **`penjualan`** – Mencatat _Log/Header_ transaksi utama per _invoice_, referensi tanggal, jumlah tagihan, pembeli, serta petugas yang melayani.
- **`detailpenjualan`** – Rekaman detail per _item/keranjang_ apa saja (jumlah qty produk) yang terkait dengan ID di tabel penjualan utama.

---

## 🧪 Cara Menjalankan Proyek

1. Clone / download _project_ ini (_zip_).
2. Pindahkan folder hasil ekstraksi ke folder _local web server_ (`htdocs` untuk XAMPP, atau direktori `www` untuk Laragon / WAMP).
3. Nyalakan layanan Apache dan MySQL pada server komputer Anda.
4. Buat dan _setup_ struktur database baru, lalu **Import file `kasir.sql`** yang disediakan via phpMyAdmin/HeidiSQL.
5. Cek file `config/database.php` dan **atur konfigurasi _password_ MySQL** komputer Anda jikalau direkomendasikan. (Kosongkan _var password_ jika standar XAMPP).
6. Buka halaman, jalankan di _browser_ Anda:

```text
http://localhost/pra-usk-1-Alfareza3/
```

- Kredensial _Default_: `admin` / `password` atau `petugas` / `password`.

---

## 📂 Struktur Folder

```text
/api        # Script endpoint asinkron sederhana untuk fetch data kasir via AJAX
/classes    # Berisi core pemrosesan (Auth, Pelanggan, Penjualan, Produk) tipe Object-oriented
/config     # Komponen pengaturan inisiasi ke database server
/includes   # Template layout yang modular supaya gampang di-reuse (header/footer)
/pages      # Letak antar-muka / frontend UI per setiap modul aplikasi
/index.php  # Portal sistem pintu masuk awal halaman Autentikasi Login (Login Page)
```

---

## 👤 Developer

**Dimas Fahri Alfareza**

SMKTI Airlangga - PPLG

---

## 📄 Lisensi

Proyek ini sepenuhnya bersifat _Open Source_ yang dirancang secara spesifik, ekslusif diperuntukkan dan didedikasikan atas Ujian Praktik Sekolah. Anda diizinkan untuk memodifikasi atau memperbaruinya untuk tujuan edukasi.

---
