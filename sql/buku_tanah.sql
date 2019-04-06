-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2019 at 03:33 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku_tanah`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_arsip`
--

CREATE TABLE `data_arsip` (
  `id` int(11) NOT NULL,
  `noarsip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pencipta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit_pengolah` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `uraian` text COLLATE utf8_unicode_ci NOT NULL,
  `ket` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nobox` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `media` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` text COLLATE utf8_unicode_ci,
  `tgl_input` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_arsip`
--

INSERT INTO `data_arsip` (`id`, `noarsip`, `pencipta`, `unit_pengolah`, `tanggal`, `uraian`, `ket`, `kode`, `jumlah`, `nobox`, `lokasi`, `media`, `file`, `tgl_input`, `tgl_update`, `username`) VALUES
(30, 'Kuta Alam 1-200', '12', '10', '2019-04-01', '', 'asli', '63', 1, '', '7', '14', '', '2019-04-06 20:13:16', '0000-00-00 00:00:00', 'admin'),
(31, 'kuta alam 200-300', '12', '10', '2019-04-06', '', 'asli', '63', 1, '', '7', '14', '', '2019-04-06 20:13:40', '0000-00-00 00:00:00', 'admin'),
(32, 'kuta alam 300-400', '12', '10', '2019-04-01', '', 'asli', '63', 1, '', '7', '14', '', '2019-04-06 20:13:54', '0000-00-00 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `master_kode`
--

CREATE TABLE `master_kode` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `retensi` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_kode`
--

INSERT INTO `master_kode` (`id`, `kode`, `nama`, `retensi`) VALUES
(64, '2', 'Warkah', 100),
(63, '1', 'Buku Tanah', 100);

-- --------------------------------------------------------

--
-- Table structure for table `master_lokasi`
--

CREATE TABLE `master_lokasi` (
  `id` int(11) NOT NULL,
  `nama_lokasi` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_lokasi`
--

INSERT INTO `master_lokasi` (`id`, `nama_lokasi`) VALUES
(7, 'Ruang Arsip');

-- --------------------------------------------------------

--
-- Table structure for table `master_media`
--

CREATE TABLE `master_media` (
  `id` int(11) NOT NULL,
  `nama_media` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_media`
--

INSERT INTO `master_media` (`id`, `nama_media`) VALUES
(14, 'Dokumen'),
(13, 'Gambar'),
(12, 'PDF');

-- --------------------------------------------------------

--
-- Table structure for table `master_pencipta`
--

CREATE TABLE `master_pencipta` (
  `id` int(11) NOT NULL,
  `nama_pencipta` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_pencipta`
--

INSERT INTO `master_pencipta` (`id`, `nama_pencipta`) VALUES
(12, '-');

-- --------------------------------------------------------

--
-- Table structure for table `master_pengolah`
--

CREATE TABLE `master_pengolah` (
  `id` int(11) NOT NULL,
  `nama_pengolah` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_pengolah`
--

INSERT INTO `master_pengolah` (`id`, `nama_pengolah`) VALUES
(10, 'Arsip');

-- --------------------------------------------------------

--
-- Table structure for table `master_user`
--

CREATE TABLE `master_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` enum('admin','user') COLLATE utf8_unicode_ci NOT NULL,
  `akses_klas` text COLLATE utf8_unicode_ci NOT NULL,
  `akses_modul` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_user`
--

INSERT INTO `master_user` (`id`, `username`, `password`, `tipe`, `akses_klas`, `akses_modul`) VALUES
(1, 'admin', '$2y$10$M57KBHBtl9HsFQP6rxrqUOuSqO/MiQJnTqTu4wM5OlWwa/lTKyb2S', 'admin', '', '{"entridata":"on","sirkulasi":"on","klasifikasi":"on","pencipta":"on","pengolah":"on","lokasi":"on","media":"on","user":"on","import":"on"}'),
(2, 'user', '$2y$10$uE3PKQ/tWOoGQwnfKXVYjOXHRHQ43o5PgYpN2wf2lp.iI4.DFshoq', 'user', 'sdm,hkp', '{"sirkulasi":"on"}'),
(5, 'Muhammad Irfan,S.T', '198209122008041002', 'user', 'umum', 'null'),
(3, 'Drs.SURIA BAKTI, M.Si', '196408071986031004', 'user', 'umum', 'null'),
(4, 'Aminah, S.SiT', '197605221996032001', 'user', 'umum', 'null'),
(6, 'Mustafa M, S.S.T. , M.M.', '197601061997031002', 'user', 'umum', 'null'),
(7, 'Ratna Keumala, SH', '196604071986032002', 'user', 'umum', 'null'),
(8, 'Rosita, S.Sos', '196311051986032003', 'user', 'umum', 'null'),
(9, 'Zubir, S.E', '196212311990031048', 'user', 'umum', 'null'),
(10, 'Afriana Dewi, SH', '197304301996032001', 'user', 'umum', 'null'),
(11, 'Ayin Aulina, S.H', '197902122006042003', 'user', 'umum', 'null'),
(12, 'Fajri', '196402101986031004', 'user', 'umum', 'null'),
(13, 'Nurlaila, S.H', '196405171986032001', 'user', 'umum', 'null'),
(14, 'Wahyu Ardiansyah,ST', '198901282011011002', 'user', 'umum', 'null'),
(15, 'ASEP MUHAMAD RIZAL, A.P', '199711262018011001', 'user', 'umum', 'null'),
(16, 'CAHYA RAMDHANI, A.P', '199601232018011001', 'user', 'umum', 'null'),
(17, 'Cut Erli Susanti, S.H', '198504242008042001', 'user', 'umum', 'null'),
(18, 'Cut Mutiawati', '198512142006042001', 'user', 'umum', 'null'),
(19, 'Darwin', '197207082012121003', 'user', 'umum', 'null'),
(20, 'Faisal', '198503012012121002', 'user', 'umum', 'null'),
(21, 'Fajar Abdul Rochim', '199007062012121001', 'user', 'umum', 'null'),
(22, 'Hamidah', '196206231990032002', 'user', 'umum', 'null'),
(23, 'Hariririski, A.Md', '199509252019031002', 'user', 'umum', 'null'),
(24, 'Indra Anwar, S.E', '198102112012121001', 'user', 'umum', 'null'),
(25, 'KASYFUL HUMAM, S.Si', '199204222018011001', 'user', 'umum', 'null'),
(26, 'Khaidir', '196103021983031003', 'user', 'umum', 'null'),
(27, 'Khairullah', '196904032012121002', 'user', 'umum', 'null'),
(28, 'MAULANA FATAHILLAH, S.H', '199408172018011002', 'user', 'umum', 'null'),
(29, 'Maya Fitriyanda', '198005102007012002', 'user', 'umum', 'null'),
(30, 'Merinda, A. Md', '198302042011012011', 'user', 'umum', 'null'),
(31, 'Misbah Andalia', '198702192009122003', 'user', 'umum', 'null'),
(32, 'Mutiara Tiara Indra, S.E', '199306302019032006', 'user', 'umum', 'null'),
(33, 'Nana Rizki, S. Kom', '198609232011012016', 'user', 'umum', 'null'),
(34, 'Naufal Sulistyanto, A.P', '199905292019031001', 'user', 'umum', 'null'),
(35, 'Nelza Riando', '198404162009121002', 'user', 'umum', 'null'),
(36, 'Nora Ervina', '198409172009032004', 'user', 'umum', 'null'),
(37, 'QAMILAH AYUNI AZZAHRA, S.H', '199401232018012001', 'user', 'umum', 'null'),
(38, 'Rahmanda Harbi, A.P', '199911152019031001', 'user', 'umum', 'null'),
(39, 'RELINDA RESI YUNI AMALIA, A.P', '199806132018012001', 'user', 'umum', 'null'),
(40, 'Rishka Ariesna', '198704142009032002', 'user', 'umum', 'null'),
(41, 'Siti Ulfitatun Syahyuni', '199806052011012012', 'user', 'umum', 'null'),
(42, 'Siti Wulandari', '199010292009122001', 'user', 'umum', 'null'),
(43, 'Sofia Nelly, S.P', '199311192019032006', 'user', 'umum', 'null'),
(44, 'Syuhada', '198712182009121003', 'user', 'umum', 'null'),
(45, 'Yunni Efrina Caniago, S.H', '199306182019032003', 'user', 'umum', 'null'),
(46, 'Adiyat Al-Kausar', '24593', 'user', 'umum', 'null'),
(47, 'Aprima Winata', '24599', 'user', 'umum', 'null'),
(48, 'Cut Daiyan Januar', '24585', 'user', 'umum', 'null'),
(49, 'Cut Lisa Miranda', '26858', 'user', 'umum', 'null'),
(50, 'Cut Munandar', '24602', 'user', 'umum', 'null'),
(51, 'Firdansyah', '24600', 'user', 'umum', 'null'),
(52, 'Haula Akhrijni', '24592', 'user', 'umum', 'null'),
(53, 'Husnizar', '24594', 'user', 'umum', 'null'),
(54, 'Imam Surya Saputra', '24584', 'user', 'umum', 'null'),
(55, 'M. Iqbal Maulana', '24590', 'user', 'umum', 'null'),
(56, 'Muhammad Haiqal', '24587', 'user', 'umum', 'null'),
(57, 'Muhammad Indra Setia', '24595', 'user', 'umum', 'null'),
(58, 'Munirah', '24598', 'user', 'umum', 'null'),
(59, 'Nashriyana', '24588', 'user', 'umum', 'null'),
(60, 'Oktifa Deviana', '24596', 'user', 'umum', 'null'),
(61, 'Quddus Zuhana', '24583', 'user', 'umum', 'null'),
(62, 'Sri Yaoulli Harman Masri', '24586', 'user', 'umum', 'null'),
(63, 'Tari Miranti', '24601', 'user', 'umum', 'null'),
(64, 'Yulia Rafni', '24597', 'user', 'umum', 'null'),
(65, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sirkulasi`
--

CREATE TABLE `sirkulasi` (
  `id` int(11) NOT NULL,
  `noarsip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username_peminjam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keperluan` text COLLATE utf8_unicode_ci,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_haruskembali` datetime NOT NULL,
  `tgl_pengembalian` datetime DEFAULT NULL,
  `tgl_transaksi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sirkulasi`
--

INSERT INTO `sirkulasi` (`id`, `noarsip`, `username_peminjam`, `keperluan`, `tgl_pinjam`, `tgl_haruskembali`, `tgl_pengembalian`, `tgl_transaksi`) VALUES
(15, 'Kuta Alam 1-200', 'Hariririski, A.Md', 'Imput Buku Tanah', '2019-04-06 00:00:00', '2019-04-09 00:00:00', NULL, '2019-04-06 20:14:34'),
(16, 'kuta alam 200-300', 'Adiyat Al-Kausar', 'Adalah', '2019-04-30 00:00:00', '2019-05-15 00:00:00', NULL, '2019-04-30 20:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `id` int(11) NOT NULL,
  `kode_transaksi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username_transaksi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tgl_transaksi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_arsip`
--
ALTER TABLE `data_arsip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noarsip` (`noarsip`),
  ADD KEY `pencipta` (`pencipta`),
  ADD KEY `unit_pengolah` (`unit_pengolah`);
ALTER TABLE `data_arsip` ADD FULLTEXT KEY `uraian` (`uraian`);

--
-- Indexes for table `master_kode`
--
ALTER TABLE `master_kode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD KEY `nama` (`nama`);

--
-- Indexes for table `master_lokasi`
--
ALTER TABLE `master_lokasi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_lokasi` (`nama_lokasi`);

--
-- Indexes for table `master_media`
--
ALTER TABLE `master_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_media` (`nama_media`);

--
-- Indexes for table `master_pencipta`
--
ALTER TABLE `master_pencipta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_pencipta` (`nama_pencipta`);

--
-- Indexes for table `master_pengolah`
--
ALTER TABLE `master_pengolah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_pengolah` (`nama_pengolah`);

--
-- Indexes for table `master_user`
--
ALTER TABLE `master_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sirkulasi`
--
ALTER TABLE `sirkulasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noarsip` (`noarsip`),
  ADD KEY `username_peminjam` (`username_peminjam`),
  ADD KEY `tgl_pinjam` (`tgl_pinjam`),
  ADD KEY `tgl_pengembalian` (`tgl_pengembalian`),
  ADD KEY `tgl_haruskembali` (`tgl_haruskembali`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `username_transaksi` (`username_transaksi`),
  ADD KEY `tgl_transaksi` (`tgl_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_arsip`
--
ALTER TABLE `data_arsip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `master_kode`
--
ALTER TABLE `master_kode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `master_lokasi`
--
ALTER TABLE `master_lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `master_media`
--
ALTER TABLE `master_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `master_pencipta`
--
ALTER TABLE `master_pencipta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `master_pengolah`
--
ALTER TABLE `master_pengolah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `master_user`
--
ALTER TABLE `master_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `sirkulasi`
--
ALTER TABLE `sirkulasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
