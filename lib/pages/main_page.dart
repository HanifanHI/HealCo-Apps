import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/pages/detect_page.dart';
import 'package:healco/pages/petunjuk_page.dart';
import 'package:healco/pages/predict_page.dart';
import 'package:healco/provider/page_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'book_page.dart';
import 'history_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const BookPage();
      // case 2:
      //   return const DetectPage();
      case 3:
        return const HistoryPage();
      case 4:
        return const PetunjukPage();
      default:
        return const HomePage();
    }
  }

  Widget customBottomNavigation(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, value, child) => Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.09,
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height * 0.09,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Container(
            // width: double.infinity,
            // height: MediaQuery.of(context).size.height * 0.09,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cWhiteColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -1),
                  color: cBlackColor.withOpacity(0.1),
                  blurRadius: 10,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // NOTE : BERANDA
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      value.setPage(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          value.page == 0
                              ? 'assets/icons/ic_beranda_fill.png'
                              : 'assets/icons/ic_beranda.png',
                          width: MediaQuery.of(context).size.height * 0.032,
                          height: MediaQuery.of(context).size.height * 0.032,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Beranda',
                          style: value.page == 0
                              ? orangeTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                )
                              : blackTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                // NOTE : BOOK
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      value.setPage(1);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          value.page == 1
                              ? 'assets/icons/ic_book_fill.png'
                              : 'assets/icons/ic_book.png',
                          width: MediaQuery.of(context).size.height * 0.032,
                          height: MediaQuery.of(context).size.height * 0.032,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Penyakit',
                          style: value.page == 1
                              ? orangeTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                )
                              : blackTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // value.setPage(2);
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ambil Gambar',
                                      style: blackTextstyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                        'assets/icons/ic_cancel.png',
                                        width: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    getImageWithCamera().then(
                                      (value) {
                                        if (value != null) {
                                          Navigator.pushNamed(
                                            context,
                                            StartDetectPage.routeName,
                                            arguments: value,
                                          );
                                          // Navigator.pop(context);
                                          // Provider.of<PageProvider>(context,
                                          //         listen: false)
                                          //     .setPage(0);
                                        }
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/ic_camera.png',
                                        width: 40,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Kamera',
                                        style: blackTextstyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: regular,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () {
                                    getImageWithGallery().then(
                                      (value) {
                                        if (value != null) {
                                          Navigator.pushNamed(
                                            context,
                                            StartDetectPage.routeName,
                                            arguments: value,
                                          );
                                        }
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/ic_gallery.png',
                                        width: 40,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Galeri',
                                        style: blackTextstyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: regular,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          -(MediaQuery.of(context).size.height -
                              MediaQuery.of(context).size.height * 0.97),
                        ),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            color: cOrangeColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: cWhiteColor,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/ic_scan.png',
                              width: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // NOTE : RIWAYAT
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      value.setPage(3);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          value.page == 3
                              ? 'assets/icons/ic_riwayat_fill.png'
                              : 'assets/icons/ic_riwayat.png',
                          width: MediaQuery.of(context).size.height * 0.032,
                          height: MediaQuery.of(context).size.height * 0.032,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Riwayat',
                          style: value.page == 3
                              ? orangeTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                )
                              : blackTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),

                // NOTE : PETUNJUK
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      value.setPage(4);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          value.page == 4
                              ? 'assets/icons/ic_info_fill.png'
                              : 'assets/icons/ic_info.png',
                          width: MediaQuery.of(context).size.height * 0.032,
                          height: MediaQuery.of(context).size.height * 0.032,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Petunjuk',
                          style: value.page == 4
                              ? orangeTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                )
                              : blackTextstyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PageProvider>(
        builder: (context, value, child) => Stack(
          children: [
            buildContent(value.page),
            customBottomNavigation(context),
          ],
        ),
      ),
    );
  }
}
