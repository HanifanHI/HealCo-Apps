import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';

class CaraPenggunaan extends StatelessWidget {
  const CaraPenggunaan({super.key});

  static const routeName = '/cara_penggunaan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        backgroundColor: cWhiteColor,
        elevation: 1,
        titleSpacing: 0,
        title: Text(
          'Cara Penggunaan',
          style: blackTextstyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            letterSpacing: 1,
          ),
        ),
        leading: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/ic_arrow_left_black.png',
              width: 24,
            ),
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
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Masuk ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'ke halaman Beranda ',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'kemudian ',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'pilih menu Kamera ',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'atau ',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'Galeri ',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'untuk mengambil gambar.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Setelah mengambil gambar ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'klik tombol Deteksi, ',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'tunggu sampai proses deteksi selesai.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            'Lihat hasil diagnosis penyakit tanaman jagung anda.',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Klik tombol Lihat Detail ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'untuk melihat informasi mengenai detail penyakit tersebut.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // NOTE : RIWAYAT DETEKSI
              const SizedBox(
                height: 20,
              ),
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
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Masuk ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'ke halaman Riwayat.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Klik salah satu item ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'untuk melihat detail informasi mengenai diagnosis penyakit tersebut.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Klik tombol hapus ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'untuk menghapus item yang dipilih.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // NOTE : TIPS DETEKSI
              const SizedBox(
                height: 20,
              ),
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
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            'Ketika mengambil gambar menggunakan kamera, pastikan ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'kamera fokus ke kerusakan daun jagung.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Pastikan ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'gambar terlihat dengan jelas.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.  ',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Pencahayaan ',
                        style: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                          letterSpacing: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'tidak terlalu gelap ',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'ataupun ',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'terlalu terang.',
                            style: blackTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
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
