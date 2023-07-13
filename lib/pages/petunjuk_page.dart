import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';

class PetunjukPage extends StatelessWidget {
  const PetunjukPage({super.key});

  static const routeName = '/petunjuk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: cWhiteColor,
        title: Text(
          'Petunjuk',
          style: blackTextstyle.copyWith(
            fontSize: MediaQuery.of(context).size.height * 0.026,
            fontWeight: medium,
            letterSpacing: 0.4,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE : TIPS DETEKSI
              const SizedBox(height: 25),
              Text(
                'Tips Deteksi Penyakit',
                style: blackTextstyle.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.024,
                  fontWeight: medium,
                  letterSpacing: 0.4,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.   ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Ketika mengambil gambar melalui kamera, pastikan kamera fokus ke kerusakan daun jagung.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Jarak pengambilan gambar yang baik adalah 20 cm - 40 cm.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pastikan gambar terlihat dengan jelas.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Pencahayaan tidak terlalu gelap ataupun terlalu terang.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Ketika mengambil gambar melalui galeri, format yang bisa digunakan adalah .jpg dan .png.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                'Contoh yang benar :',
                style: grayTextstyle.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: regular,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/img_benar1.jpg',
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/img_benar3.jpg',
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/img_benar4.jpg',
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Contoh yang salah :',
                style: grayTextstyle.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: regular,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/img_salah1.jpg',
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/img_salah3.jpg',
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/img_salah4.jpg',
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),

              // NOTE : DETEKSI PENYAKIT
              const SizedBox(height: 20),
              Text(
                'Cara Deteksi penyakit',
                style: blackTextstyle.copyWith(
                  fontSize: MediaQuery.of(context).size.height * 0.024,
                  fontWeight: medium,
                  letterSpacing: 0.4,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.   ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Klik tombol Scan yang berada di tengah.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Selanjutnya pilih Kamera atau Galeri untuk pengambilan gambar.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Setelah mengambil gambar klik tombol Deteksi, tunggu sampai proses deteksi selesai.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Lihat hasil diagnosis penyakit tanaman jagung Anda.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5.  ',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Klik tombol Lihat Detail untuk melihat informasi mengenai detail penyakit tersebut.',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09 + 40),
            ],
          ),
        ),
      ),
    );
  }
}
