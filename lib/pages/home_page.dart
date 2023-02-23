import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/pages/login_page.dart';
import 'package:healco/pages/main_page.dart';
import 'package:healco/pages/start_detect_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();

  Future getImageWithCamera() async {
    final gambar = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = gambar;
    });
    return image;
  }

  Future getImageWithGallery() async {
    final gambar = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = gambar;
    });
    return image;
  }

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // ApiService apiService = ApiService();
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: cOrangeColor,
          flexibleSpace: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/img_header_wave.png',
              width: 250,
            ),
          ),
          title: Text(
            'HealCo',
            style: whiteTextstyle.copyWith(
              fontSize: 28,
              fontWeight: bold,
              letterSpacing: 2,
            ),
          ),
          // actions: [
          //   GestureDetector(
          //     onTap: () async {
          //       Navigator.pushNamedAndRemoveUntil(
          //         context,
          //         LoginPage.routeName,
          //         (route) => false,
          //       );
          //       apiService.token = null;
          //       final pref = await SharedPreferences.getInstance();
          //       pref.clear();
          //       setState(() {});
          //       print('Token Dihapus');
          //     },
          //     child: Image.asset(
          //       'assets/icons/ic_logout.png',
          //       width: 24,
          //     ),
          //   ),
          // ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CarouselSlider(
                carouselController: _controller,
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_petani.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_petani.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_petani.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: double.infinity,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 1,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Identifikasi',
                style: blackTextstyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Ayo! identifikasi penyakit tanaman jagung anda',
                style: grayTextstyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cWhiteColor,
                border: Border.all(
                  color: cOrangeColor,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImageWithCamera().then((value) {
                            if (value == null) {
                              Navigator.pushNamed(context, MainPage.routeName);
                            } else {
                              Navigator.pushNamed(
                                context,
                                StartDetectPage.routeName,
                                arguments: value,
                              );
                            }
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: cOrangeColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/icons/ic_camera.png',
                            width: 80,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Kamera',
                        style: blackTextstyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImageWithGallery().then((value) {
                            if (value == null) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pushNamed(
                                context,
                                StartDetectPage.routeName,
                                arguments: value,
                              );
                            }
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: cOrangeColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/icons/ic_gallery.png',
                            width: 80,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Galeri',
                        style: blackTextstyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Penyakit',
                style: blackTextstyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Penyakit yang umum dijumpai pada daun jagung',
                style: grayTextstyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/img_hawar.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Hawar Daun',
                            style: blackTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                              letterSpacing: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/img_karat.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Karat Daun',
                            style: blackTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                              letterSpacing: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/img_bintik.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Bercak Daun',
                            style: blackTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                              letterSpacing: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
