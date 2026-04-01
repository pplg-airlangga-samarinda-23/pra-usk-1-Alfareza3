-- ============================================
-- DATABASE: Aplikasi Kasir UKK RPL Paket 4
-- ============================================

CREATE DATABASE IF NOT EXISTS kasir CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE kasir;

-- ============================================
-- TABEL: users (admin & petugas)
-- ============================================
CREATE TABLE users (
    UserID      INT(11) AUTO_INCREMENT PRIMARY KEY,
    NamaUser    VARCHAR(100) NOT NULL,
    Username    VARCHAR(50)  NOT NULL UNIQUE,
    Password    VARCHAR(255) NOT NULL,
    Role        ENUM('administrator','petugas') NOT NULL DEFAULT 'petugas',
    CreatedAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABEL: pelanggan
-- ============================================
CREATE TABLE pelanggan (
    PelangganID     INT(11) AUTO_INCREMENT PRIMARY KEY,
    NamaPelanggan   VARCHAR(255) NOT NULL,
    Alamat          TEXT,
    NomorTelepon    VARCHAR(15)
);

-- ============================================
-- TABEL: produk
-- ============================================
CREATE TABLE produk (
    ProdukID        INT(11) AUTO_INCREMENT PRIMARY KEY,
    NamaProduk      VARCHAR(255) NOT NULL,
    Harga           DECIMAL(10,2) NOT NULL DEFAULT 0,
    Stok            INT(11) NOT NULL DEFAULT 0
);

-- ============================================
-- TABEL: penjualan
-- ============================================
CREATE TABLE penjualan (
    PenjualanID     INT(11) AUTO_INCREMENT PRIMARY KEY,
    TanggalPenjualan DATE NOT NULL,
    TotalHarga      DECIMAL(10,2) NOT NULL DEFAULT 0,
    PelangganID     INT(11),
    UserID          INT(11),
    FOREIGN KEY (PelangganID) REFERENCES pelanggan(PelangganID) ON DELETE SET NULL,
    FOREIGN KEY (UserID)      REFERENCES users(UserID) ON DELETE SET NULL
);

-- ============================================
-- TABEL: detailpenjualan
-- ============================================
CREATE TABLE detailpenjualan (
    DetailID        INT(11) AUTO_INCREMENT PRIMARY KEY,
    PenjualanID     INT(11) NOT NULL,
    ProdukID        INT(11) NOT NULL,
    JumlahProduk    INT(11) NOT NULL DEFAULT 1,
    Subtotal        DECIMAL(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (PenjualanID) REFERENCES penjualan(PenjualanID) ON DELETE CASCADE,
    FOREIGN KEY (ProdukID)    REFERENCES produk(ProdukID) ON DELETE RESTRICT
);

-- ============================================
-- DATA AWAL
-- ============================================

-- Admin default (password: admin123)
INSERT INTO users (NamaUser, Username, Password, Role) VALUES
('Administrator', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'administrator'),
('Petugas Kasir', 'petugas', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'petugas');

-- Produk contoh
INSERT INTO produk (NamaProduk, Harga, Stok) VALUES
('Beras 5kg',    65000, 100),
('Minyak Goreng 1L', 18000, 80),
('Gula Pasir 1kg',   14000, 60),
('Sabun Mandi',       5000, 150),
('Shampo Sachet',     2000, 200);

-- Pelanggan contoh
INSERT INTO pelanggan (NamaPelanggan, Alamat, NomorTelepon) VALUES
('Budi Santoso',   'Jl. Merdeka No.1 Samarinda', '081234567890'),
('Siti Aminah',    'Jl. Pattimura No.5 Samarinda', '082345678901'),
('Rahmat Hidayat', 'Jl. Sudirman No.10 Samarinda', '083456789012');
