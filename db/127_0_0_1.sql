-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2022 pada 03.47
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akademik`
--
CREATE DATABASE IF NOT EXISTS `akademik` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `akademik`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `Nim` int(11) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis Kelamin` varchar(30) NOT NULL,
  `Program study` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`Nim`);
--
-- Database: `dbpenjualan`
--
CREATE DATABASE IF NOT EXISTS `dbpenjualan` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbpenjualan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbarang`
--

CREATE TABLE `tbarang` (
  `idbarang` int(11) NOT NULL,
  `nmbarang` varchar(50) NOT NULL,
  `idjenis` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `iddist` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tcustomer`
--

CREATE TABLE `tcustomer` (
  `idcust` int(11) NOT NULL,
  `nmcust` varchar(35) NOT NULL,
  `jenkel` enum('P','L') NOT NULL,
  `tgllahir` date NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(13) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tdistributor`
--

CREATE TABLE `tdistributor` (
  `iddist` int(11) NOT NULL,
  `nmdist` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tjenis`
--

CREATE TABLE `tjenis` (
  `idjenis` int(11) NOT NULL,
  `jenisbarang` varchar(35) NOT NULL,
  `ket` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tjual`
--

CREATE TABLE `tjual` (
  `idjual` int(11) NOT NULL,
  `tgljual` date NOT NULL,
  `idbarang` int(11) NOT NULL,
  `jmlbarang` int(11) NOT NULL,
  `idcust` int(11) NOT NULL,
  `totalharga` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembali` int(11) NOT NULL,
  `idpetugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tpetugas`
--

CREATE TABLE `tpetugas` (
  `idpetugas` int(11) NOT NULL,
  `nmpetugas` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(13) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tuser`
--

CREATE TABLE `tuser` (
  `iduser` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `hakakses` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `vbarang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vbarang` (
`idbarang` int(11)
,`nmbarang` varchar(50)
,`jenisbarang` varchar(35)
,`stok` int(11)
,`harga` int(11)
,`nmdist` varchar(35)
,`status` enum('0','1')
);

-- --------------------------------------------------------

--
-- Struktur untuk view `vbarang`
--
DROP TABLE IF EXISTS `vbarang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vbarang`  AS  select `tbarang`.`idbarang` AS `idbarang`,`tbarang`.`nmbarang` AS `nmbarang`,`tjenis`.`jenisbarang` AS `jenisbarang`,`tbarang`.`stok` AS `stok`,`tbarang`.`harga` AS `harga`,`tdistributor`.`nmdist` AS `nmdist`,`tbarang`.`status` AS `status` from ((`tbarang` join `tdistributor` on((`tbarang`.`iddist` = `tdistributor`.`iddist`))) join `tjenis` on((`tbarang`.`idjenis` = `tjenis`.`idjenis`))) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbarang`
--
ALTER TABLE `tbarang`
  ADD PRIMARY KEY (`idbarang`);

--
-- Indeks untuk tabel `tcustomer`
--
ALTER TABLE `tcustomer`
  ADD PRIMARY KEY (`idcust`);

--
-- Indeks untuk tabel `tdistributor`
--
ALTER TABLE `tdistributor`
  ADD PRIMARY KEY (`iddist`);

--
-- Indeks untuk tabel `tjenis`
--
ALTER TABLE `tjenis`
  ADD PRIMARY KEY (`idjenis`);

--
-- Indeks untuk tabel `tjual`
--
ALTER TABLE `tjual`
  ADD PRIMARY KEY (`idjual`);

--
-- Indeks untuk tabel `tpetugas`
--
ALTER TABLE `tpetugas`
  ADD PRIMARY KEY (`idpetugas`);

--
-- Indeks untuk tabel `tuser`
--
ALTER TABLE `tuser`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tdistributor`
--
ALTER TABLE `tdistributor`
  MODIFY `iddist` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tjenis`
--
ALTER TABLE `tjenis`
  MODIFY `idjenis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tuser`
--
ALTER TABLE `tuser`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `dbsekolah`
--
CREATE DATABASE IF NOT EXISTS `dbsekolah` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbsekolah`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hak_akses` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`id`, `email`, `password`, `nama`, `hak_akses`) VALUES
(1, 'chorunisasyifa@gmail.com', '9215bf1bcf8b84ee1fe675666d3fa81a', 'syifa ', '1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `db_penjualan`
--
CREATE DATABASE IF NOT EXISTS `db_penjualan` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_penjualan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_barang`
--

CREATE TABLE `t_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `harga_barang` varchar(15) NOT NULL,
  `stok_barang` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_barang`
--

INSERT INTO `t_barang` (`id_barang`, `nama_barang`, `id_jenis`, `harga_barang`, `stok_barang`, `foto`) VALUES
(250001, 'buku', 1, '2000', 10, ''),
(250002, 'buku', 1, '2000', 10, 'Screenshot (7).png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_customer`
--

CREATE TABLE `t_customer` (
  `id_customer` int(11) NOT NULL,
  `nama_customer` varchar(75) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_customer`
--

INSERT INTO `t_customer` (`id_customer`, `nama_customer`, `alamat`, `no_hp`, `foto`) VALUES
(100001, 'syifa', 'cianjur', '12382', 'Screenshot (3).png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jenis`
--

CREATE TABLE `t_jenis` (
  `id_jenis` int(11) NOT NULL,
  `jenis_barang` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_jenis`
--

INSERT INTO `t_jenis` (`id_jenis`, `jenis_barang`) VALUES
(1, 'pakaian'),
(2, 'MAKANAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jual`
--

CREATE TABLE `t_jual` (
  `id_jual` int(11) NOT NULL,
  `tanggal_jual` date NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `total_harga` varchar(15) NOT NULL,
  `keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_barang`
--
ALTER TABLE `t_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `t_customer`
--
ALTER TABLE `t_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `t_jenis`
--
ALTER TABLE `t_jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `t_jual`
--
ALTER TABLE `t_jual`
  ADD PRIMARY KEY (`id_jual`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_jenis`
--
ALTER TABLE `t_jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `db_perpus`
--
CREATE DATABASE IF NOT EXISTS `db_perpus` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_perpus`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `jenis_kategori` varchar(25) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `jenis_kategori`, `keterangan`) VALUES
(3, 'ipa', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `No_Hp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_anggota`
--

INSERT INTO `tb_anggota` (`id_anggota`, `nama_anggota`, `alamat`, `tanggal_lahir`, `jenis_kelamin`, `No_Hp`) VALUES
(27677, 'syipa', 'bandung', '2022-01-20', 'P', '772828');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `tahun_buku` varchar(10) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `penerbit` varchar(30) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul`, `id_kategori`, `tahun_buku`, `deskripsi`, `penerbit`, `stok`) VALUES
(779, 'ips', 3, '2021', 'tumbuhan', 'erlangga', 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `id_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `id_buku` int(11) NOT NULL,
  `jumlah_buku` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status` enum('dipinjam','dikembalikan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_peminjaman`
--

INSERT INTO `tb_peminjaman` (`id_pinjam`, `tanggal_pinjam`, `id_buku`, `jumlah_buku`, `id_anggota`, `tanggal_kembali`, `status`) VALUES
(676, '2022-03-10', 779, 6, 27677, '2022-03-17', 'dikembalikan'),
(7880, '2022-03-10', 779, 5, 27677, '2022-03-11', 'dipinjam');

--
-- Trigger `tb_peminjaman`
--
DELIMITER $$
CREATE TRIGGER `penambahan` AFTER UPDATE ON `tb_peminjaman` FOR EACH ROW BEGIN
UPDATE tb_buku SET stok=stok+new.jumlah_buku WHERE id_buku=new.id_buku;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pengurangan` AFTER INSERT ON `tb_peminjaman` FOR EACH ROW BEGIN
UPDATE tb_buku SET stok=stok-new.jumlah_buku WHERE id_buku=new.id_buku;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD UNIQUE KEY `id_anggota` (`id_anggota`);

--
-- Indeks untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `db_toko`
--
CREATE DATABASE IF NOT EXISTS `db_toko` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_toko`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_barang` text NOT NULL,
  `merk` varchar(255) NOT NULL,
  `harga_beli` varchar(255) NOT NULL,
  `harga_jual` varchar(255) NOT NULL,
  `satuan_barang` varchar(255) NOT NULL,
  `stok` text NOT NULL,
  `tgl_input` varchar(255) NOT NULL,
  `tgl_update` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `id_kategori`, `nama_barang`, `merk`, `harga_beli`, `harga_jual`, `satuan_barang`, `stok`, `tgl_input`, `tgl_update`) VALUES
('456789', 456789, 'baju', 'gucci', '1000000', '1500000', '800', '156', 'senin 18 juli 2022', 'selasa 19 juli 2022'),
('BR001', 1, 'Pensil', 'Fabel Castel', '1000', '2000', 'PCS', '7', '7 May 2017, 10:34', '7 May 2017, 10:35'),
('BR002', 5, 'sabun lifeboy', 'lifeboy', '2000', '3000', 'PCS', '4', '7 May 2017, 10:52', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `tgl_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tgl_input`) VALUES
(1, 'ATK', '7 May 2017, 10:23'),
(5, 'Sabun', '7 May 2017, 10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` char(32) NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `user`, `pass`, `id_member`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nm_member` varchar(255) NOT NULL,
  `alamat_member` text NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gambar` text NOT NULL,
  `NIK` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nm_member`, `alamat_member`, `telepon`, `email`, `gambar`, `NIK`) VALUES
(1, 'Muthia Rahmah', 'Cipanas', '089618173609', 'muthiarhmh@gmail.com', 'logo.png', '12314121');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL,
  `periode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nota`
--

INSERT INTO `nota` (`id_nota`, `id_barang`, `id_member`, `jumlah`, `total`, `tanggal_input`, `periode`) VALUES
(1, 'BR001', 1, '2', '4000', '7 May 2017, 10:49', ''),
(16, 'BR001', 1, '2', '4000', '20 August 2019, 13:49', '08-2019'),
(17, 'BR002', 1, '2', '6000', '20 August 2019, 13:49', '08-2019');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `penjualan`
--
DELIMITER $$
CREATE TRIGGER `edit` AFTER UPDATE ON `penjualan` FOR EACH ROW BEGIN
	UPDATE barang SET stok = stok-NEW.jumlah + OLD.jumlah
    where id_barang = NEW.id_barang;
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(11) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `alamat_toko` text NOT NULL,
  `tlp` varchar(255) NOT NULL,
  `nama_pemilik` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`, `tlp`, `nama_pemilik`) VALUES
(1, 'CV Daruttaqwa', 'Jl. Ujung Harapan Kav. Daruttaqwa RT 005/014 No.25, Kab. Bekasi ', '089618173609', 'Fauzan Falah');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `db_ujjikom_spp`
--
CREATE DATABASE IF NOT EXISTS `db_ujjikom_spp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_ujjikom_spp`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tm_pembayaran_spp`
--

CREATE TABLE `tm_pembayaran_spp` (
  `bayar_id` int(8) NOT NULL,
  `petugas_id` varchar(8) NOT NULL,
  `siswa_nisn` char(10) NOT NULL,
  `spp_id` varchar(32) NOT NULL,
  `bayar_tgl` datetime NOT NULL,
  `bayar_bln` varchar(2) NOT NULL,
  `bayar_thn` varchar(4) NOT NULL,
  `bayar_jml` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tm_petugas`
--

CREATE TABLE `tm_petugas` (
  `petugas_id` varchar(8) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `petugas_nama` varchar(64) NOT NULL,
  `petugas_level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tm_siswa`
--

CREATE TABLE `tm_siswa` (
  `siswa_nisn` char(10) NOT NULL,
  `spp_id` varchar(32) NOT NULL,
  `kelas_id` varchar(8) NOT NULL,
  `siswa_nis` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_kelas`
--

CREATE TABLE `tr_kelas` (
  `kelas_id` varchar(8) NOT NULL,
  `kelas_nama` varchar(16) NOT NULL,
  `kelas_keahlian` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_spp`
--

CREATE TABLE `tr_spp` (
  `spp_id` varchar(8) NOT NULL,
  `spp_thn` int(4) NOT NULL,
  `spp_nominal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tm_pembayaran_spp`
--
ALTER TABLE `tm_pembayaran_spp`
  ADD PRIMARY KEY (`bayar_id`),
  ADD KEY `petugas_id` (`petugas_id`);

--
-- Indeks untuk tabel `tm_petugas`
--
ALTER TABLE `tm_petugas`
  ADD PRIMARY KEY (`petugas_id`);

--
-- Indeks untuk tabel `tm_siswa`
--
ALTER TABLE `tm_siswa`
  ADD PRIMARY KEY (`siswa_nisn`);

--
-- Indeks untuk tabel `tr_kelas`
--
ALTER TABLE `tr_kelas`
  ADD PRIMARY KEY (`kelas_id`);

--
-- Indeks untuk tabel `tr_spp`
--
ALTER TABLE `tr_spp`
  ADD PRIMARY KEY (`spp_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tm_pembayaran_spp`
--
ALTER TABLE `tm_pembayaran_spp`
  MODIFY `bayar_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tm_pembayaran_spp`
--
ALTER TABLE `tm_pembayaran_spp`
  ADD CONSTRAINT `tm_pembayaran_spp_ibfk_1` FOREIGN KEY (`petugas_id`) REFERENCES `tm_petugas` (`petugas_id`);
--
-- Database: `kinkun`
--
CREATE DATABASE IF NOT EXISTS `kinkun` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kinkun`;
--
-- Database: `pembayaranspp_2`
--
CREATE DATABASE IF NOT EXISTS `pembayaranspp_2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pembayaranspp_2`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tm_pembayaran_lain`
--

CREATE TABLE `tm_pembayaran_lain` (
  `byr_lain_id` varchar(16) NOT NULL,
  `siswa_nisn` char(10) DEFAULT NULL,
  `petugas_id` varchar(8) DEFAULT NULL,
  `bl_id` varchar(2) DEFAULT NULL,
  `byr_lain_tgl` date DEFAULT NULL,
  `byr_lain_jml` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tm_pembayaran_lain`
--

INSERT INTO `tm_pembayaran_lain` (`byr_lain_id`, `siswa_nisn`, `petugas_id`, `bl_id`, `byr_lain_tgl`, `byr_lain_jml`) VALUES
('BL202103001', '3202101', '001', '01', '2021-03-17', 250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_biaya_lain`
--

CREATE TABLE `tr_biaya_lain` (
  `bl_id` varchar(2) NOT NULL,
  `bl_nama` varchar(32) DEFAULT NULL,
  `bl_nilai` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_biaya_lain`
--

INSERT INTO `tr_biaya_lain` (`bl_id`, `bl_nama`, `bl_nilai`) VALUES
('01', 'Asrama', 250000),
('02', 'Katering', 250000),
('03', 'Loundry', 100000),
('04', 'Buku Paket Kelas 1', 500000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tm_pembayaran_lain`
--
ALTER TABLE `tm_pembayaran_lain`
  ADD PRIMARY KEY (`byr_lain_id`);

--
-- Indeks untuk tabel `tr_biaya_lain`
--
ALTER TABLE `tr_biaya_lain`
  ADD PRIMARY KEY (`bl_id`);
--
-- Database: `pengadaan_barang`
--
CREATE DATABASE IF NOT EXISTS `pengadaan_barang` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pengadaan_barang`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang masuk`
--

CREATE TABLE `barang masuk` (
  `lemari` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `perpustakaan`
--
CREATE DATABASE IF NOT EXISTS `perpustakaan` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `perpustakaan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `nama` varchar(15) DEFAULT NULL,
  `id_anggota` int(8) NOT NULL,
  `alamat` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`nama`, `id_anggota`, `alamat`) VALUES
('sinta', 766574343, 'jakarta'),
('arman', 776665554, 'bandung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(10) NOT NULL,
  `judul_buku` tinytext,
  `id_penerbit` int(6) DEFAULT NULL,
  `id_pengarang` int(12) DEFAULT NULL,
  `tahun_buku` date DEFAULT NULL,
  `jumlah_buku` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `id_penerbit`, `id_pengarang`, `tahun_buku`, `jumlah_buku`) VALUES
(12, 'rekayasa prangkat lunak', 2, 32, '2021-10-21', 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `kode_transaksi` int(10) NOT NULL,
  `id_anggota` int(10) DEFAULT NULL,
  `id_buku` int(10) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`kode_transaksi`, `id_anggota`, `id_buku`, `tanggal_pinjam`, `tanggal_kembali`) VALUES
(23, 3, 8, '2021-10-21', '2021-10-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(10) DEFAULT NULL,
  `nama` char(20) DEFAULT NULL,
  `alamat` tinytext,
  `no_telp` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama`, `alamat`, `no_telp`) VALUES
(789988998, 's', 'bogor', 709876),
(789988998, 's', 'bogor', 709876);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengarang`
--

CREATE TABLE `pengarang` (
  `id_pengarang` int(12) NOT NULL,
  `nama` char(18) DEFAULT NULL,
  `alamat` tinytext,
  `no_telp` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengarang`
--

INSERT INTO `pengarang` (`id_pengarang`, `nama`, `alamat`, `no_telp`) VALUES
(12, 'sinta', 'bandung', 891982);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `tgl_pengembalian` date DEFAULT NULL,
  `denda` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengembalian`
--

INSERT INTO `pengembalian` (`tgl_pengembalian`, `denda`) VALUES
('0000-00-00', 1000),
('2021-11-25', 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak`
--

CREATE TABLE `rak` (
  `kd_rak` int(4) NOT NULL,
  `lokasi` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reg_buku`
--

CREATE TABLE `reg_buku` (
  `no_reg` int(4) NOT NULL,
  `id_buku` int(6) DEFAULT NULL,
  `kd_rak` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`kode_transaksi`);

--
-- Indeks untuk tabel `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`id_pengarang`);

--
-- Indeks untuk tabel `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`kd_rak`);

--
-- Indeks untuk tabel `reg_buku`
--
ALTER TABLE `reg_buku`
  ADD PRIMARY KEY (`no_reg`);
--
-- Database: `phpmvc`
--
CREATE DATABASE IF NOT EXISTS `phpmvc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phpmvc`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_siswa`
--

CREATE TABLE `t_siswa` (
  `id` int(100) NOT NULL,
  `Nis` int(15) NOT NULL,
  `Nama` varchar(40) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `Tanggal_lahir` varchar(30) NOT NULL,
  `Kelas` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_siswa`
--

INSERT INTO `t_siswa` (`id`, `Nis`, `Nama`, `tempat_lahir`, `Tanggal_lahir`, `Kelas`) VALUES
(1, 123, 'syifa', 'bogor', '09', 'XIBRPL'),
(1, 123, 'syifa', 'bogor', '09', 'XIBRPL');
--
-- Database: `phpmvc1`
--
CREATE DATABASE IF NOT EXISTS `phpmvc1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phpmvc1`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(12) NOT NULL,
  `NIS` int(20) NOT NULL,
  `Nama` varchar(17) NOT NULL,
  `Tempat_lahir` varchar(18) NOT NULL,
  `Tanggal_lahir` varchar(90) NOT NULL,
  `Kelas` varchar(88) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data untuk tabel `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data untuk tabel `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'setup_actors', 'table', 'performance_schema', ''),
('root', 'tm_petugas', 'table', 'db_ujjikom_spp', ''),
('root', 'tr_kelas', 'table', 'db_ujjikom_spp', ''),
('root', 'tr_spp', 'table', 'db_ujjikom_spp', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('db_ujjikom_spp', 'tm_pembayaran_spp', 'petugas_id');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('', '2022-01-13 04:33:38', '{\"lang\":\"id\"}'),
('root', '2022-10-29 01:47:39', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"id\",\"NavigationWidth\":242}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeks untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeks untuk tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeks untuk tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeks untuk tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeks untuk tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeks untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeks untuk tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeks untuk tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeks untuk tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeks untuk tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `recording`
--
CREATE DATABASE IF NOT EXISTS `recording` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `recording`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruminansia`
--

CREATE TABLE `ruminansia` (
  `No_ternak` int(100) NOT NULL,
  `Jenis_ternak` varchar(20) NOT NULL,
  `Tanggal_lahir` date NOT NULL,
  `Tanggal_produksi` date NOT NULL,
  `Jenis_kelamin` varchar(10) NOT NULL,
  `Jenis_pakan` varchar(22) NOT NULL,
  `Penerimaan` varchar(33) NOT NULL,
  `Pemberian` varchar(20) NOT NULL,
  `Sisa` varchar(20) NOT NULL,
  `Rata_rata` varchar(20) NOT NULL,
  `Keterangan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruminansia`
--

INSERT INTO `ruminansia` (`No_ternak`, `Jenis_ternak`, `Tanggal_lahir`, `Tanggal_produksi`, `Jenis_kelamin`, `Jenis_pakan`, `Penerimaan`, `Pemberian`, `Sisa`, `Rata_rata`, `Keterangan`) VALUES
(1234, 'sapi', '2022-09-14', '2022-09-14', 'Jantan', 'rumput', '20000', '800', '', '1', '-'),
(33333, 'sapi', '2022-10-01', '2022-09-21', 'Betina', 'rumput', '20000', '11', '', '0', '-');
--
-- Database: `recording2`
--
CREATE DATABASE IF NOT EXISTS `recording2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `recording2`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `non_ruminansia`
--

CREATE TABLE `non_ruminansia` (
  `No_ternak` int(100) NOT NULL,
  `Judul_kegiatan` varchar(20) NOT NULL,
  `Minggu_tahun` varchar(20) NOT NULL,
  `Unit_kandang` varchar(50) NOT NULL,
  `Tanggal_ternak` date NOT NULL,
  `Jenis_ternak` varchar(50) NOT NULL,
  `Jenis_kelamin` varchar(40) NOT NULL,
  `Jumlah_ekor` int(50) NOT NULL,
  `Produksi_butir` int(99) NOT NULL,
  `Produksi_persen` varchar(50) NOT NULL,
  `Butir_telur_pecah` int(99) NOT NULL,
  `Persen_telur_pecah` varchar(100) NOT NULL,
  `Butir_tetas` int(50) NOT NULL,
  `Butir_koperasi` int(88) NOT NULL,
  `Jumlah` int(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `non_ruminansia`
--

INSERT INTO `non_ruminansia` (`No_ternak`, `Judul_kegiatan`, `Minggu_tahun`, `Unit_kandang`, `Tanggal_ternak`, `Jenis_ternak`, `Jenis_kelamin`, `Jumlah_ekor`, `Produksi_butir`, `Produksi_persen`, `Butir_telur_pecah`, `Persen_telur_pecah`, `Butir_tetas`, `Butir_koperasi`, `Jumlah`, `Keterangan`) VALUES
(21333, 'menghitung tetas tel', '2-2022', 'ayam 1', '2022-09-05', 'ayam kampung', 'betina', 200, 211, '7%', 177, '4%', 60, 800, 860, '-');
--
-- Database: `sekolah`
--
CREATE DATABASE IF NOT EXISTS `sekolah` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sekolah`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `nama` varchar(25) NOT NULL,
  `cd_guru` int(6) NOT NULL,
  `mapel` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `siswa`
--
CREATE DATABASE IF NOT EXISTS `siswa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `siswa`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_siswa`
--

CREATE TABLE `t_siswa` (
  `Id` int(13) NOT NULL,
  `Nis` int(15) NOT NULL,
  `Nama` varchar(40) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `Tanggal_lahir` varchar(30) NOT NULL,
  `Kelas` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_siswa`
--
ALTER TABLE `t_siswa`
  ADD PRIMARY KEY (`Id`);
--
-- Database: `sppsekolah`
--
CREATE DATABASE IF NOT EXISTS `sppsekolah` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sppsekolah`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(5) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `namalengkap` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`idadmin`, `username`, `password`, `namalengkap`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'erick irwansyah '),
(3, 'operator', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'meyki ardiansyah'),
(4, 'operator', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Awaludin'),
(5, NULL, '4b583376b2767b923c3e1da60d10de59', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `idguru` int(5) NOT NULL,
  `namaguru` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`idguru`, `namaguru`) VALUES
(1, 'SUPRIANTO, SPd'),
(4, 'MEYKI ARDIANSYAH'),
(5, 'JERRY SANJAYA'),
(6, 'REZA ADSIANSYAH'),
(7, 'HONGKY WIRANATA'),
(8, 'WAHYU CHANDRA'),
(9, 'JAPRIANNSYAH'),
(11, 'NEDI RENALDI'),
(15, ' ERICK IRWANSYAH '),
(16, 'Awaludin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `idsiswa` int(10) NOT NULL,
  `nis` varchar(10) DEFAULT NULL,
  `namasiswa` varchar(40) DEFAULT NULL,
  `kelas` varchar(10) DEFAULT NULL,
  `tahunajaran` varchar(10) DEFAULT NULL,
  `biaya` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`idsiswa`, `nis`, `namasiswa`, `kelas`, `tahunajaran`, `biaya`) VALUES
(23, '201810001', 'hanggara P A', 'IX A', '2018/2019', 250000),
(24, '201810002', 'Meyki Ardiansyah', 'VII B', '2018/2019', 250000),
(25, '201810003', 'Chandra Wijaya', 'VII C', '2018/2019', 250000),
(26, '201810004', 'Dedi Marlin Hidayat', 'VIII A', '2018/2019', 250000),
(27, '201810005', 'Novian Sandi Putra', 'VIII B', '2018/2019', 250000),
(28, '201810006', 'Rina Puspita Sari', 'VII A', '2018/2019', 250000),
(29, '201810007', 'Jeki Sanjaka', 'VIII C', '2018/2019', 250000),
(30, '201810008', 'Andry Al-febri', 'IX B', '2018/2019', 250000),
(31, '201810009', 'Atang Al-Farizi', 'X A', '2018/2019', 250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `idspp` int(5) NOT NULL,
  `idsiswa` int(10) DEFAULT NULL,
  `jatuhtempo` date DEFAULT NULL,
  `bulan` varchar(20) DEFAULT NULL,
  `nobayar` varchar(10) DEFAULT NULL,
  `tglbayar` date DEFAULT NULL,
  `jumlah` int(20) DEFAULT NULL,
  `ket` varchar(20) DEFAULT NULL,
  `idadmin` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spp`
--

INSERT INTO `spp` (`idspp`, `idsiswa`, `jatuhtempo`, `bulan`, `nobayar`, `tglbayar`, `jumlah`, `ket`, `idadmin`) VALUES
(1, 23, '2018-10-10', 'Oktober  2018', '20170919', '2018-09-24', 250000, 'LUNAS', 1),
(2, 23, '2018-11-10', 'November  2018', '1809240001', '2018-09-24', 250000, 'LUNAS', 1),
(3, 23, '2018-12-10', 'Desember  2018', '1809240002', '2018-09-24', 250000, 'LUNAS', 1),
(4, 23, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(5, 23, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(6, 23, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(7, 23, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(8, 23, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(9, 23, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(10, 23, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(11, 23, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(12, 23, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL),
(13, 24, '2018-10-10', 'Oktober  2018', '1809250004', '2018-09-25', 250000, 'LUNAS', 1),
(14, 24, '2018-11-10', 'November  2018', '1809240011', '2018-09-24', 250000, 'LUNAS', 1),
(15, 24, '2018-12-10', 'Desember  2018', '1809240012', '2018-09-24', 250000, 'LUNAS', 1),
(16, 24, '2019-01-10', 'januari  2019', '1809240014', '2018-09-24', 250000, 'LUNAS', 1),
(17, 24, '2019-02-10', 'Februari  2019', '1809240015', '2018-09-24', 250000, 'LUNAS', 1),
(18, 24, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(19, 24, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(20, 24, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(21, 24, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(22, 24, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(23, 24, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(24, 24, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL),
(25, 25, '2018-10-10', 'Oktober  2018', NULL, NULL, 250000, NULL, NULL),
(26, 25, '2018-11-10', 'November  2018', NULL, NULL, 250000, NULL, NULL),
(27, 25, '2018-12-10', 'Desember  2018', NULL, NULL, 250000, NULL, NULL),
(28, 25, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(29, 25, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(30, 25, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(31, 25, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(32, 25, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(33, 25, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(34, 25, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(35, 25, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(36, 25, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL),
(37, 26, '2018-10-10', 'Oktober  2018', NULL, NULL, 250000, NULL, NULL),
(38, 26, '2018-11-10', 'November  2018', NULL, NULL, 250000, NULL, NULL),
(39, 26, '2018-12-10', 'Desember  2018', NULL, NULL, 250000, NULL, NULL),
(40, 26, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(41, 26, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(42, 26, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(43, 26, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(44, 26, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(45, 26, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(46, 26, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(47, 26, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(48, 26, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL),
(49, 27, '2018-10-10', 'Oktober  2018', NULL, NULL, 250000, NULL, NULL),
(50, 27, '2018-11-10', 'November  2018', NULL, NULL, 250000, NULL, NULL),
(51, 27, '2018-12-10', 'Desember  2018', NULL, NULL, 250000, NULL, NULL),
(52, 27, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(53, 27, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(54, 27, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(55, 27, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(56, 27, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(57, 27, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(58, 27, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(59, 27, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(60, 27, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL),
(61, 28, '2018-10-10', 'Oktober  2018', NULL, NULL, 250000, NULL, NULL),
(62, 28, '2018-11-10', 'November  2018', NULL, NULL, 250000, NULL, NULL),
(63, 28, '2018-12-10', 'Desember  2018', NULL, NULL, 250000, NULL, NULL),
(64, 28, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(65, 28, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(66, 28, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(67, 28, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(68, 28, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(69, 28, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(70, 28, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(71, 28, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(72, 28, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL),
(73, 29, '2018-10-10', 'Oktober  2018', '1809250007', '2018-09-25', 250000, 'LUNAS', 1),
(74, 29, '2018-11-10', 'November  2018', NULL, NULL, 250000, NULL, NULL),
(75, 29, '2018-12-10', 'Desember  2018', NULL, NULL, 250000, NULL, NULL),
(76, 29, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(77, 29, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(78, 29, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(79, 29, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(80, 29, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(81, 29, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(82, 29, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(83, 29, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(84, 29, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL),
(85, 30, '2018-10-10', 'Oktober  2018', NULL, NULL, 250000, NULL, NULL),
(86, 30, '2018-11-10', 'November  2018', NULL, NULL, 250000, NULL, NULL),
(87, 30, '2018-12-10', 'Desember  2018', NULL, NULL, 250000, NULL, NULL),
(88, 30, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(89, 30, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(90, 30, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(91, 30, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(92, 30, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(93, 30, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(94, 30, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(95, 30, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(96, 30, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL),
(97, 31, '2018-10-10', 'Oktober  2018', '1809250005', '2018-09-25', 250000, 'LUNAS', 1),
(98, 31, '2018-11-10', 'November  2018', '1809250006', '2018-09-25', 250000, 'LUNAS', 1),
(99, 31, '2018-12-10', 'Desember  2018', NULL, NULL, 250000, NULL, NULL),
(100, 31, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(101, 31, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(102, 31, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(103, 31, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(104, 31, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(105, 31, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(106, 31, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(107, 31, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(108, 31, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `walikelas`
--

CREATE TABLE `walikelas` (
  `kelas` varchar(10) NOT NULL,
  `idguru` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `walikelas`
--

INSERT INTO `walikelas` (`kelas`, `idguru`) VALUES
('IX A', 1),
('VII C', 1),
('VIII B', 1),
('VII B', 4),
('X A', 5),
('VIII C', 6),
('VIII A', 7),
('IX B', 9),
('VII A', 11),
('X B', 15);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`idguru`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idsiswa`),
  ADD KEY `fk_kelas` (`kelas`);

--
-- Indeks untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`idspp`),
  ADD KEY `fk_admin` (`idadmin`),
  ADD KEY `fk_siswa` (`idsiswa`);

--
-- Indeks untuk tabel `walikelas`
--
ALTER TABLE `walikelas`
  ADD PRIMARY KEY (`kelas`),
  ADD KEY `fk_guru` (`idguru`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `idguru` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idsiswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `spp`
--
ALTER TABLE `spp`
  MODIFY `idspp` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_kelas` FOREIGN KEY (`kelas`) REFERENCES `walikelas` (`kelas`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`idadmin`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `walikelas`
--
ALTER TABLE `walikelas`
  ADD CONSTRAINT `fk_guru` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`) ON UPDATE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `ujikomguru`
--
CREATE DATABASE IF NOT EXISTS `ujikomguru` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ujikomguru`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `Kd_Guru` int(15) NOT NULL,
  `Nama_Guru` varchar(30) NOT NULL,
  `TTL` varchar(30) NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL,
  `Alamat` varchar(20) NOT NULL,
  `No_Hp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`Kd_Guru`, `Nama_Guru`, `TTL`, `Jenis_Kelamin`, `Alamat`, `No_Hp`) VALUES
(12345, 'iin', '1980-10-06', 'perempuan', 'kota cianjur', 8932918),
(6778877, 'joko', '2003-12-29', 'laki laki', 'jalan nununana desa ', 1879101);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`Kd_Guru`);
--
-- Database: `ujikom_spp`
--
CREATE DATABASE IF NOT EXISTS `ujikom_spp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ujikom_spp`;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `pembayaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `pembayaran` (
`bayar_id` varchar(16)
,`siswa_nisn` char(10)
,`spp_id` varchar(32)
,`bayar_tgl` datetime
,`bayar_bln` varchar(2)
,`bayar_thn` varchar(4)
,`siswa_nama` varchar(32)
,`petugas_nama` varchar(64)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `siswa` (
`siswa_nisn` char(10)
,`spp_id` varchar(32)
,`kelas_id` varchar(8)
,`siswa_nis` char(8)
,`siswa_nama` varchar(32)
,`spp_thn` int(4)
,`spp_nominal` double
,`kelas_nama` varchar(16)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tm_pembayaran_spp`
--

CREATE TABLE `tm_pembayaran_spp` (
  `bayar_id` varchar(16) NOT NULL,
  `petugas_id` varchar(8) DEFAULT NULL,
  `siswa_nisn` char(10) DEFAULT NULL,
  `spp_id` varchar(32) DEFAULT NULL,
  `bayar_tgl` datetime DEFAULT NULL,
  `bayar_bln` varchar(2) DEFAULT NULL,
  `bayar_thn` varchar(4) DEFAULT NULL,
  `bayar_jml` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tm_pembayaran_spp`
--

INSERT INTO `tm_pembayaran_spp` (`bayar_id`, `petugas_id`, `siswa_nisn`, `spp_id`, `bayar_tgl`, `bayar_bln`, `bayar_thn`, `bayar_jml`) VALUES
('2021030001', '001', '3202101', 'SPP2020', '2021-03-17 11:13:00', '03', '2021', 50000),
('2021030002', '001', '3202102', 'SPP2020', '2021-03-17 00:00:00', '03', '2021', 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tm_petugas`
--

CREATE TABLE `tm_petugas` (
  `petugas_id` varchar(8) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `petugas_nama` varchar(64) DEFAULT NULL,
  `petugas_level` enum('admin','petugas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tm_petugas`
--

INSERT INTO `tm_petugas` (`petugas_id`, `username`, `password`, `petugas_nama`, `petugas_level`) VALUES
('001', 'admin', 'admin', 'Administrator', 'admin'),
('002', 'kasir', 'kasir', 'Kasir SPP', 'petugas'),
('003', 'wati', 'kasir', 'Ibu Wati', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tm_siswa`
--

CREATE TABLE `tm_siswa` (
  `siswa_nisn` char(10) NOT NULL,
  `spp_id` varchar(32) NOT NULL,
  `kelas_id` varchar(8) DEFAULT NULL,
  `siswa_nis` char(8) DEFAULT NULL,
  `siswa_nama` varchar(32) DEFAULT NULL,
  `siswa_alamat` text,
  `siswa_no_telp` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tm_siswa`
--

INSERT INTO `tm_siswa` (`siswa_nisn`, `spp_id`, `kelas_id`, `siswa_nis`, `siswa_nama`, `siswa_alamat`, `siswa_no_telp`) VALUES
('3202101', 'SPP2020', 'K001', '2020001', 'Jungkok', 'Cugenang', '080989999'),
('3202102', 'SPP2020', 'K001', '2020002', 'Jimin', 'Cipanas', '0220839484'),
('3202103', 'SPP2020', 'K002', '2020003', 'J-Hope', 'Ciparigi', '0813456789'),
('3202104', 'SPP2020', 'K001', '2020004', 'Jennie', 'Cilamaya', '09890'),
('3202105', 'SPP2020', 'K002', '2020005', 'Lisa', 'Cikotok', '0989');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_kelas`
--

CREATE TABLE `tr_kelas` (
  `kelas_id` varchar(8) NOT NULL,
  `kelas_nama` varchar(16) DEFAULT NULL,
  `kelas_keahlian` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_kelas`
--

INSERT INTO `tr_kelas` (`kelas_id`, `kelas_nama`, `kelas_keahlian`) VALUES
('K001', 'X RPL 1', 'RPL'),
('K002', 'X RPL 2', 'RPL'),
('K003', 'XI RPL 1', 'RPL'),
('K004', 'XII RPL 1', 'RPL ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_spp`
--

CREATE TABLE `tr_spp` (
  `spp_id` varchar(32) NOT NULL,
  `spp_thn` int(4) DEFAULT NULL,
  `spp_nominal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_spp`
--

INSERT INTO `tr_spp` (`spp_id`, `spp_thn`, `spp_nominal`) VALUES
('SPP2020', 2020, 500000),
('SPP2021', 2021, 550000);

-- --------------------------------------------------------

--
-- Struktur untuk view `pembayaran`
--
DROP TABLE IF EXISTS `pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pembayaran`  AS  select `tm_pembayaran_spp`.`bayar_id` AS `bayar_id`,`tm_pembayaran_spp`.`siswa_nisn` AS `siswa_nisn`,`tm_pembayaran_spp`.`spp_id` AS `spp_id`,`tm_pembayaran_spp`.`bayar_tgl` AS `bayar_tgl`,`tm_pembayaran_spp`.`bayar_bln` AS `bayar_bln`,`tm_pembayaran_spp`.`bayar_thn` AS `bayar_thn`,`tm_siswa`.`siswa_nama` AS `siswa_nama`,`tm_petugas`.`petugas_nama` AS `petugas_nama` from ((`tm_pembayaran_spp` left join `tm_siswa` on((`tm_pembayaran_spp`.`siswa_nisn` = `tm_siswa`.`siswa_nisn`))) left join `tm_petugas` on((`tm_petugas`.`petugas_id` = `tm_pembayaran_spp`.`petugas_id`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `siswa`
--
DROP TABLE IF EXISTS `siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `siswa`  AS  select `tm_siswa`.`siswa_nisn` AS `siswa_nisn`,`tm_siswa`.`spp_id` AS `spp_id`,`tm_siswa`.`kelas_id` AS `kelas_id`,`tm_siswa`.`siswa_nis` AS `siswa_nis`,`tm_siswa`.`siswa_nama` AS `siswa_nama`,`tr_spp`.`spp_thn` AS `spp_thn`,`tr_spp`.`spp_nominal` AS `spp_nominal`,`tr_kelas`.`kelas_nama` AS `kelas_nama` from ((`tm_siswa` left join `tr_spp` on((`tm_siswa`.`spp_id` = `tr_spp`.`spp_id`))) left join `tr_kelas` on((`tr_kelas`.`kelas_id` = `tm_siswa`.`kelas_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tm_pembayaran_spp`
--
ALTER TABLE `tm_pembayaran_spp`
  ADD PRIMARY KEY (`bayar_id`);

--
-- Indeks untuk tabel `tm_petugas`
--
ALTER TABLE `tm_petugas`
  ADD PRIMARY KEY (`petugas_id`);

--
-- Indeks untuk tabel `tm_siswa`
--
ALTER TABLE `tm_siswa`
  ADD PRIMARY KEY (`siswa_nisn`,`spp_id`);

--
-- Indeks untuk tabel `tr_kelas`
--
ALTER TABLE `tr_kelas`
  ADD PRIMARY KEY (`kelas_id`);

--
-- Indeks untuk tabel `tr_spp`
--
ALTER TABLE `tr_spp`
  ADD PRIMARY KEY (`spp_id`);
--
-- Database: `xi b rpl`
--
CREATE DATABASE IF NOT EXISTS `xi b rpl` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `xi b rpl`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar  piket`
--

CREATE TABLE `daftar  piket` (
  `anggota` varchar(25) NOT NULL,
  `hari` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `daftar  piket`
--

INSERT INTO `daftar  piket` (`anggota`, `hari`) VALUES
('nadira', '2021-11-04'),
('alya', '2021-11-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `nama siswa` varchar(25) NOT NULL,
  `nis` int(10) NOT NULL,
  `daftar hadir` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`nama siswa`, `nis`, `daftar hadir`) VALUES
('alya', 27261, 'sakit'),
('syifa', 718716, 'hadir');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`nis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
