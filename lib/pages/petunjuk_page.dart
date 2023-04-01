import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';

class PetunjukPage extends StatelessWidget {
  const PetunjukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        backgroundColor: cWhiteColor,
        elevation: 1,
        title: Text(
          'Petunjuk',
          style: blackTextstyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE : DETEKSI PENYAKIT
              const SizedBox(
                height: 20,
              ),
              Text(
                'Deteksi penyakit',
                style: blackTextstyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Masuk ke halaman Beranda kemudian pilih menu Kamera atau Galeri untuk mengambil gambar.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Setelah mengambil gambar klik tombol Deteksi, tunggu sampai proses deteksi selesai.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Lihat hasil diagnosis penyakit tanaman jagung anda.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Klik tombol Lihat Detail untuk melihat informasi mengenai detail penyakit tersebut.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              // NOTE : RIWAYAT DETEKSI
              const SizedBox(height: 20),
              Text(
                'Lihat Riwayat Deteksi',
                style: blackTextstyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Masuk ke halaman Riwayat.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Klik salah satu item untuk melihat detail informasi mengenai diagnosis penyakit tersebut.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Klik tombol hapus untuk menghapus item yang dipilih.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              // NOTE : TIPS DETEKSI
              const SizedBox(height: 20),
              Text(
                'Tips Deteksi Penyakit',
                style: blackTextstyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Dekatkan kamera anda ke daun jagung yang ingin di deteksi.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pastikan kamera fokus ke kerusakan daun jagung.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Posisikan kerusakan daun jagung di tengah kamera.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pencahayaan tidak terlalu gelap ataupun terlalu terang.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pastikan gambar terlihat dengan jelas.',
                      style: blackTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
