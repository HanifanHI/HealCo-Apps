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
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.09 +
                MediaQuery.of(context).padding.top,
            minHeight: MediaQuery.of(context).size.height * 0.09 +
                MediaQuery.of(context).padding.top,
            maxWidth: MediaQuery.of(context).size.width,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: AppBar(
            backgroundColor: cWhiteColor,
            elevation: 1,
            title: Text(
              'Petunjuk',
              style: blackTextstyle.copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: bold,
                letterSpacing: 1,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: bold,
                  letterSpacing: 1,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Masuk ke halaman Beranda kemudian pilih menu Kamera atau Galeri untuk mengambil gambar.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Setelah mengambil gambar klik tombol Deteksi, tunggu sampai proses deteksi selesai.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Lihat hasil diagnosis penyakit tanaman jagung anda.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Klik tombol Lihat Detail untuk melihat informasi mengenai detail penyakit tersebut.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: bold,
                  letterSpacing: 1,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Masuk ke halaman Riwayat.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Klik salah satu item untuk melihat detail informasi mengenai diagnosis penyakit tersebut.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Klik tombol hapus untuk menghapus item yang dipilih.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: bold,
                  letterSpacing: 1,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Dekatkan kamera anda ke daun jagung yang ingin di deteksi.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pastikan kamera fokus ke kerusakan daun jagung.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Posisikan kerusakan daun jagung di tengah kamera.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pencahayaan tidak terlalu gelap ataupun terlalu terang.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
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
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pastikan gambar terlihat dengan jelas.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
