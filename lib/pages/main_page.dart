import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../interface/image_interface.dart';
import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/disease_list.dart';
import '../pages/petunjuk_page.dart';
import '../pages/predict_page.dart';
import '../provider/page_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> implements ImageInterface {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Future getImageWithCamera() async {
    final gambar = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = gambar;
    });
    return _image;
  }

  @override
  Future getImageWithGallery() async {
    final gambar = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = gambar;
    });
    return _image;
  }

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const DiseaseList();
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
      builder: (context, value, _) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.09,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: cWhiteColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -1),
                color: cGrayColor.withOpacity(0.3),
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
                        width: MediaQuery.of(context).size.height * 0.03,
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Beranda',
                        style: value.page == 0
                            ? greenTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                fontWeight: regular,
                                letterSpacing: 0.4,
                              )
                            : blackTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                fontWeight: regular,
                                letterSpacing: 0.4,
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
                        width: MediaQuery.of(context).size.height * 0.03,
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Penyakit',
                        style: value.page == 1
                            ? greenTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                fontWeight: regular,
                                letterSpacing: 0.4,
                              )
                            : blackTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                fontWeight: regular,
                                letterSpacing: 0.4,
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
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          height:
                              MediaQuery.of(context).size.height * 0.145 + 85,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ambil Gambar',
                                    style: blackTextstyle.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.024,
                                      fontWeight: medium,
                                      letterSpacing: 0.4,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                      'assets/icons/ic_close_black.png',
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.035,
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
                                      }
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/ic_camera.png',
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.055,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Kamera',
                                      style: blackTextstyle.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.022,
                                        fontWeight: regular,
                                        letterSpacing: 0.2,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
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
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.055,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Galeri',
                                      style: blackTextstyle.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.022,
                                        fontWeight: regular,
                                        letterSpacing: 0.2,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
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
                          gradient: const LinearGradient(
                            colors: [cToscaColor, cGreenColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
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
                        width: MediaQuery.of(context).size.height * 0.03,
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Riwayat',
                        style: value.page == 3
                            ? greenTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                fontWeight: regular,
                                letterSpacing: 0.4,
                              )
                            : blackTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                fontWeight: regular,
                                letterSpacing: 0.4,
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
                        width: MediaQuery.of(context).size.height * 0.03,
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Petunjuk',
                        style: value.page == 4
                            ? greenTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                fontWeight: regular,
                                letterSpacing: 0.4,
                              )
                            : blackTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                fontWeight: regular,
                                letterSpacing: 0.4,
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
