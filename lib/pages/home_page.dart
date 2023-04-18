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
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
      child: ClipRect(
        child: AppBar(
          backgroundColor: cWhiteColor,
          flexibleSpace: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cToscaColor, cGreenColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/img_header_wave.png',
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                child: Text(
                  'HealCo',
                  style: whiteTextstyle.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                    fontWeight: bold,
                    letterSpacing: 2,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          // actions: [
          //   PopupMenuButton(
          //     icon: Icon(
          //       Icons.more_vert_rounded,
          //       color: cWhiteColor,
          //       size: MediaQuery.of(context).size.height * 0.04,
          //     ),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     itemBuilder: (context) {
          //       return [
          //         PopupMenuItem(
          //           value: 1,
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Text(
          //             'Bagikan',
          //             style: blackTextstyle.copyWith(
          //               fontSize: MediaQuery.of(context).size.width * 0.04,
          //               letterSpacing: 0.5,
          //             ),
          //           ),
          //         ),
          //         PopupMenuItem(
          //           value: 2,
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Text(
          //             'Kontak',
          //             style: blackTextstyle.copyWith(
          //               fontSize: MediaQuery.of(context).size.width * 0.04,
          //               letterSpacing: 0.5,
          //             ),
          //           ),
          //         ),
          //         PopupMenuItem(
          //           value: 3,
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Text(
          //             'Tentang',
          //             style: blackTextstyle.copyWith(
          //               fontSize: MediaQuery.of(context).size.width * 0.04,
          //               letterSpacing: 0.5,
          //             ),
          //           ),
          //         ),
          //         PopupMenuItem(
          //           value: 4,
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Text(
          //             'Beri Ulasan',
          //             style: blackTextstyle.copyWith(
          //               fontSize: MediaQuery.of(context).size.width * 0.04,
          //               letterSpacing: 0.5,
          //             ),
          //           ),
          //         ),
          //       ];
          //     },
          //     onSelected: (value) {
          //       switch (value) {
          //         case 1:
          //           Share.share(
          //               'https://play.google.com/store/apps/details?id=com.instagram.android&hl=id&gl=US');
          //           break;
          //         case 2:
          //           Navigator.pushNamed(
          //             context,
          //             KontakPage.routeName,
          //           );
          //           break;
          //         case 3:
          //           Navigator.pushNamed(
          //             context,
          //             TentangPage.routeName,
          //           );
          //           break;
          //         case 4:
          //           LaunchReview.launch(
          //             androidAppId: 'com.instagram.android',
          //             writeReview: false,
          //           );
          //           break;
          //       }
          //     },
          //   ),
          // ],
        ),
      ),
    );
  }

  // Widget _banner() {
  //   return ConstrainedBox(
  //     constraints: BoxConstraints(
  //       maxHeight: MediaQuery.of(context).size.height * 0.3,
  //       maxWidth: MediaQuery.of(context).size.width,
  //       minHeight: MediaQuery.of(context).size.height * 0.3,
  //       minWidth: MediaQuery.of(context).size.width,
  //     ),
  //     child: CarouselSlider(
  //       carouselController: _controller,
  //       items: const [
  //         ItemBanner(
  //           image: 'assets/images/img_petani.png',
  //         ),
  //         ItemBanner(
  //           image: 'assets/images/img_petani.png',
  //         ),
  //         ItemBanner(
  //           image: 'assets/images/img_petani.png',
  //         ),
  //       ],
  //       options: CarouselOptions(
  //         height: MediaQuery.of(context).size.width,
  //         enlargeCenterPage: true,
  //         enableInfiniteScroll: false,
  //         initialPage: 1,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              color: cGrayLightColor,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: cGrayColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Penyakit',
                          style: blackTextstyle.copyWith(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: medium,
                            letterSpacing: 0.4,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Lihat Semua',
                            style: greenTextstyle.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: medium,
                              letterSpacing: 0.2,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Image.asset(
                            'assets/icons/arrow-right-green.png',
                            height: MediaQuery.of(context).size.height * 0.02,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Daftar penyakit tanaman jagung',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) => Transform.translate(
                  offset:
                      index.isOdd ? const Offset(0, 10) : const Offset(0, -10),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 5,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      color: cGrayLightColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: cGrayColor.withOpacity(0.5),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/img_petani.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Hawar Daun',
                          style: blackTextstyle.copyWith(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            fontWeight: medium,
                            letterSpacing: 0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Jamur',
                          style: grayTextstyle.copyWith(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontWeight: regular,
                            letterSpacing: 0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Terbaru',
                          style: blackTextstyle.copyWith(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: medium,
                            letterSpacing: 0.4,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Lihat Semua',
                            style: greenTextstyle.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: medium,
                              letterSpacing: 0.2,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Image.asset(
                            'assets/icons/arrow-right-green.png',
                            height: MediaQuery.of(context).size.height * 0.02,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Riwayat hasil prediksi terbaru',
                    style: grayTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: regular,
                      letterSpacing: 0.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: cGrayLightColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: cGrayColor.withOpacity(0.5),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/img_hawar_daun.png',
                            fit: BoxFit.cover,
                            width: 100,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hawar Daun',
                                style: blackTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                  fontWeight: medium,
                                  letterSpacing: 0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '90.00 %',
                                style: grayTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  fontWeight: regular,
                                  letterSpacing: 0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/icons/ic_trash.png',
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: cGrayLightColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: cGrayColor.withOpacity(0.5),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/img_hawar_daun.png',
                            fit: BoxFit.cover,
                            width: 100,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hawar Daun',
                                style: blackTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                  fontWeight: medium,
                                  letterSpacing: 0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '90.00 %',
                                style: grayTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  fontWeight: regular,
                                  letterSpacing: 0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/icons/ic_trash.png',
                          width: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )

            // Container(
            //   height: MediaQuery.of(context).size.height * 0.25,
            //   width: MediaQuery.of(context).size.width,
            //   alignment: Alignment.center,
            //   margin: const EdgeInsets.symmetric(horizontal: 20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: cWhiteColor,
            //     border: Border.all(
            //       color: cGrayColor,
            //       width: 1,
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ConstrainedBox(
            //         constraints: BoxConstraints(
            //           maxHeight: MediaQuery.of(context).size.height * 0.25,
            //           minHeight: MediaQuery.of(context).size.height * 0.25,
            //           maxWidth: MediaQuery.of(context).size.width * 0.3,
            //           minWidth: MediaQuery.of(context).size.width * 0.3,
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             GestureDetector(
            //               onTap: () {
            //                 getImageWithCamera().then(
            //                   (value) {
            //                     if (value == null) {
            //                       Provider.of<PageProvider>(context,
            //                               listen: false)
            //                           .setPage(0);
            //                     } else {
            //                       Navigator.pushNamed(
            //                         context,
            //                         StartDetectPage.routeName,
            //                         arguments: value,
            //                       );
            //                     }
            //                   },
            //                 );
            //               },
            //               child: Container(
            //                 width: MediaQuery.of(context).size.height * 0.12,
            //                 height: MediaQuery.of(context).size.height * 0.12,
            //                 decoration: BoxDecoration(
            //                   color: cOrangeColor,
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //                 child: Image.asset(
            //                   'assets/icons/ic_camera.png',
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(height: 7),
            //             Text(
            //               'Kamera',
            //               style: blackTextstyle.copyWith(
            //                 fontSize:
            //                     MediaQuery.of(context).size.height * 0.025,
            //                 fontWeight: bold,
            //                 letterSpacing: 1,
            //               ),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 1,
            //             )
            //           ],
            //         ),
            //       ),
            //       ConstrainedBox(
            //         constraints: BoxConstraints(
            //           maxHeight: MediaQuery.of(context).size.height * 0.25,
            //           minHeight: MediaQuery.of(context).size.height * 0.25,
            //           maxWidth: MediaQuery.of(context).size.width * 0.3,
            //           minWidth: MediaQuery.of(context).size.width * 0.3,
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             GestureDetector(
            //               onTap: () {
            //                 getImageWithGallery().then(
            //                   (value) {
            //                     if (value == null) {
            //                       Provider.of<PageProvider>(context,
            //                               listen: false)
            //                           .setPage(0);
            //                     } else {
            //                       Navigator.pushNamed(
            //                         context,
            //                         StartDetectPage.routeName,
            //                         arguments: value,
            //                       );
            //                     }
            //                   },
            //                 );
            //               },
            //               child: Container(
            //                 width: MediaQuery.of(context).size.height * 0.12,
            //                 height: MediaQuery.of(context).size.height * 0.12,
            //                 decoration: BoxDecoration(
            //                   color: cOrangeColor,
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //                 child: Image.asset(
            //                   'assets/icons/ic_gallery.png',
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(height: 7),
            //             Text(
            //               'Galeri',
            //               style: blackTextstyle.copyWith(
            //                 fontSize:
            //                     MediaQuery.of(context).size.height * 0.025,
            //                 fontWeight: bold,
            //                 letterSpacing: 1,
            //               ),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 1,
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // const SizedBox(height: 15),
            // ConstrainedBox(
            //   constraints: BoxConstraints(
            //     maxHeight: MediaQuery.of(context).size.height * 0.1,
            //     maxWidth: MediaQuery.of(context).size.width,
            //     minHeight: MediaQuery.of(context).size.height * 0.1,
            //     minWidth: MediaQuery.of(context).size.width,
            //   ),
            //   child: Container(
            //     // color: cRedColor,
            //     alignment: Alignment.centerLeft,
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           'Penyakit',
            //           style: blackTextstyle.copyWith(
            //             fontSize: MediaQuery.of(context).size.height * 0.03,
            //             fontWeight: bold,
            //             letterSpacing: 1,
            //           ),
            //           overflow: TextOverflow.ellipsis,
            //           maxLines: 1,
            //         ),
            //         const SizedBox(height: 5),
            //         Text(
            //           'Penyakit yang umum dijumpai pada daun jagung',
            //           style: grayTextstyle.copyWith(
            //             fontSize: MediaQuery.of(context).size.height * 0.022,
            //             fontWeight: regular,
            //             letterSpacing: 0.8,
            //           ),
            //           overflow: TextOverflow.ellipsis,
            //           maxLines: 1,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const ItemPenyakit(
            //   image: 'assets/images/img_hawar_daun.png',
            //   title: 'Hawar Daun',
            //   subTitle: 'Setosphaeria turcica',
            // ),
            // const ItemPenyakit(
            //   image: 'assets/images/img_bercak_daun.png',
            //   title: 'Bercak Daun',
            //   subTitle: 'Bipolaris zeicola',
            // ),
            // const ItemPenyakit(
            //   image: 'assets/images/img_karat_daun.png',
            //   title: 'Karat Daun',
            //   subTitle: 'Puccinia sorghi',
            // ),
            // const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
