import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../pages/predict_page.dart';
import '../pages/tentang_page.dart';
import '../provider/page_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widgets/items/item_banner.dart';
import '../widgets/items/item_penyakit.dart';
import 'kontak_page.dart';

import 'package:share_plus/share_plus.dart';
import 'package:launch_review/launch_review.dart';

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
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
      child: ClipRect(
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
            backgroundColor: cOrangeColor,
            flexibleSpace: Transform.translate(
              offset: const Offset(-30, 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/img_header_wave.png',
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.75,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(
              'HealCo',
              style: whiteTextstyle.copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.04,
                fontWeight: bold,
                letterSpacing: 2,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            actions: [
              PopupMenuButton(
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: cWhiteColor,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 1,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Bagikan',
                        style: blackTextstyle.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Kontak',
                        style: blackTextstyle.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Tentang',
                        style: blackTextstyle.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 4,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Beri Ulasan',
                        style: blackTextstyle.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.instagram.android&hl=id&gl=US');
                      break;
                    case 2:
                      Navigator.pushNamed(
                        context,
                        KontakPage.routeName,
                      );
                      break;
                    case 3:
                      Navigator.pushNamed(
                        context,
                        TentangPage.routeName,
                      );
                      break;
                    case 4:
                      LaunchReview.launch(
                        androidAppId: 'com.instagram.android',
                        writeReview: false,
                      );
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height * 0.3,
        minWidth: MediaQuery.of(context).size.width,
      ),
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
          height: MediaQuery.of(context).size.width,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('WITDH : ${MediaQuery.of(context).size.width}');
    print('HEIGHT : ${MediaQuery.of(context).size.width * 0.5}');

    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _banner(),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.1,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height * 0.1,
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: Container(
                // color: cRedColor,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Identifikasi',
                      style: blackTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Ayo! identifikasi penyakit tanaman jagung anda',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.8,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.25,
                      minHeight: MediaQuery.of(context).size.height * 0.25,
                      maxWidth: MediaQuery.of(context).size.width * 0.3,
                      minWidth: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: Column(
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
                            width: MediaQuery.of(context).size.height * 0.12,
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              color: cOrangeColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/icons/ic_camera.png',
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          'Kamera',
                          style: blackTextstyle.copyWith(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            fontWeight: bold,
                            letterSpacing: 1,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.25,
                      minHeight: MediaQuery.of(context).size.height * 0.25,
                      maxWidth: MediaQuery.of(context).size.width * 0.3,
                      minWidth: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: Column(
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
                            width: MediaQuery.of(context).size.height * 0.12,
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              color: cOrangeColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/icons/ic_gallery.png',
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          'Galeri',
                          style: blackTextstyle.copyWith(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            fontWeight: bold,
                            letterSpacing: 1,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.1,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height * 0.1,
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: Container(
                // color: cRedColor,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Penyakit',
                      style: blackTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Penyakit yang umum dijumpai pada daun jagung',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.8,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
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
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
