import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/pages/cara_penggunaan_page.dart';
import 'package:healco/pages/start_detect_page.dart';
import 'package:healco/provider/page_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widgets/items/item_banner.dart';
import '../widgets/items/item_penyakit.dart';

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

  PreferredSizeWidget _appbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        backgroundColor: cOrangeColor,
        flexibleSpace: Transform.translate(
          offset: const Offset(-30, 7),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/img_header_wave.png',
              width: 250,
            ),
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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                CaraPenggunaan.routeName,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/icons/ic_mark_question.png',
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: CarouselSlider(
        carouselController: _controller,
        items: const [
          ItemBanner(
            image: 'assets/images/img_petani.png',
          ),
          ItemBanner(
            image: 'assets/images/img_petani.png',
          ),
          ItemBanner(
            image: 'assets/images/img_petani.png',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            _banner(),
            const SizedBox(height: 20),
            Column(
              children: [
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
              ],
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
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cWhiteColor,
                border: Border.all(
                  color: cGrayColor,
                  width: 1,
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
                          getImageWithCamera().then(
                            (value) {
                              if (value == null) {
                                Provider.of<PageProvider>(context,
                                        listen: false)
                                    .setPage(0);
                              } else {
                                Navigator.pushNamed(
                                  context,
                                  StartDetectPage.routeName,
                                  arguments: value,
                                );
                              }
                            },
                          );
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
                      const SizedBox(height: 7),
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
                          getImageWithGallery().then(
                            (value) {
                              if (value == null) {
                                Provider.of<PageProvider>(context,
                                        listen: false)
                                    .setPage(0);
                              } else {
                                Navigator.pushNamed(
                                  context,
                                  StartDetectPage.routeName,
                                  arguments: value,
                                );
                              }
                            },
                          );
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
                      const SizedBox(height: 7),
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
            const SizedBox(height: 5),
            const ItemPenyakit(
              image: 'assets/images/img_hawar_daun.png',
              title: 'Hawar Daun',
              subTitle: 'Setosphaeria turcica',
            ),
            const ItemPenyakit(
              image: 'assets/images/img_bercak_daun.png',
              title: 'Bercak Daun',
              subTitle: 'Bipolaris zeicola',
            ),
            const ItemPenyakit(
              image: 'assets/images/img_karat_daun.png',
              title: 'Karat Daun',
              subTitle: 'Puccinia sorghi',
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
