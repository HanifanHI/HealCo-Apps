import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../config/colors.dart';
import '../pages/main_page.dart';
import '../provider/detail_provider.dart';
import '../provider/page_provider.dart';
import '../utils/result_state.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static const routeName = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _currentIndex = 0;

  PreferredSizeWidget _appBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: cWhiteColor,
      titleSpacing: 0,
      title: Text(
        'Detail',
        style: blackTextstyle.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.026,
          fontWeight: medium,
          letterSpacing: 0.4,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      leading: Center(
        child: Consumer<PageProvider>(
          builder: (context, pageProv, _) => GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MainPage.routeName, (route) => false);
              pageProv.setPage(0);
            },
            child: Image.asset(
              'assets/icons/ic_arrow_left_black.png',
              width: MediaQuery.of(context).size.height * 0.035,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: _appBar(),
      body: Consumer<DetailProvider>(
        builder: (context, detailProv, _) {
          if (detailProv.resultState == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: cGreenColor,
              ),
            );
          } else if (detailProv.resultState == ResultState.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // NOTE : GAMBAR
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    // color: cGrayColor.withOpacity(0.5),
                    child: CarouselSlider(
                      items: detailProv.detailModel.gambar.map((e) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            '${detailProv.apiService.baseUrl}/uploads/disease/$e',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        initialPage: _currentIndex,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                        height: MediaQuery.of(context).size.height,
                        autoPlay: false,
                        onPageChanged: (index, _) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),

                  // NOTE : INDIKATOR SLIDER
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.02,
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    color: cWhiteColor,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: MediaQuery.of(context).size.height * 0.01,
                          height: MediaQuery.of(context).size.height * 0.01,
                          decoration: BoxDecoration(
                            color: _currentIndex == 0
                                ? cGreenColor
                                : cGrayColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: MediaQuery.of(context).size.height * 0.01,
                          height: MediaQuery.of(context).size.height * 0.01,
                          decoration: BoxDecoration(
                            color: _currentIndex == 1
                                ? cGreenColor
                                : cGrayColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: MediaQuery.of(context).size.height * 0.01,
                          height: MediaQuery.of(context).size.height * 0.01,
                          decoration: BoxDecoration(
                            color: _currentIndex == 2
                                ? cGreenColor
                                : cGrayColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: MediaQuery.of(context).size.height * 0.01,
                          height: MediaQuery.of(context).size.height * 0.01,
                          decoration: BoxDecoration(
                            color: _currentIndex == 3
                                ? cGreenColor
                                : cGrayColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: MediaQuery.of(context).size.height * 0.01,
                          height: MediaQuery.of(context).size.height * 0.01,
                          decoration: BoxDecoration(
                            color: _currentIndex == 4
                                ? cGreenColor
                                : cGrayColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 13),

                  // NOTE : NAMA PENYAKIT
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      detailProv.detailModel.nama.replaceAll('_', ' '),
                      style: blackTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.028,
                        fontWeight: medium,
                        letterSpacing: 0.4,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // NOTE : DESKRIPSI PENYEBAB
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReadMoreText(
                      detailProv.detailModel.deskripsi,
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0.2,
                      ),
                      trimLines: 4,
                      colorClickableText: cGreenColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lebih Banyak',
                      trimExpandedText: ' Lebih Sedikit',
                      moreStyle: greenTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: medium,
                        letterSpacing: 0.2,
                      ),
                      lessStyle: greenTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: medium,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // NOTE : GEJALA
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Gejala',
                      style: blackTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        fontWeight: medium,
                        letterSpacing: 0.4,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReadMoreText(
                      detailProv.detailModel.gejala,
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0.2,
                      ),
                      trimLines: 4,
                      colorClickableText: cGreenColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lebih Banyak',
                      trimExpandedText: ' Lebih Sedikit',
                      moreStyle: greenTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: medium,
                        letterSpacing: 0.2,
                      ),
                      lessStyle: greenTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: medium,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // NOTE : PENGENDALIAN
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Pengendalian',
                      style: blackTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        fontWeight: medium,
                        letterSpacing: 0.4,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReadMoreText(
                      detailProv.detailModel.pengendalian,
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: regular,
                        letterSpacing: 0.2,
                      ),
                      trimLines: 4,
                      colorClickableText: cGreenColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lebih Banyak',
                      trimExpandedText: ' Lebih Sedikit',
                      moreStyle: greenTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: medium,
                        letterSpacing: 0.2,
                      ),
                      lessStyle: greenTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: medium,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: cGrayLightColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      detailProv.message,
                      style: redTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.2,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        await detailProv.getDetail(detailProv.detailModel.nama);

                        // await Provider.of<DetailProvider>(context,
                        //         listen: false)
                        //     .getDetail(detailProv.detailModel.nama);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: cGrayColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/ic_refresh.png',
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Refresh',
                              style: whiteTextstyle.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: regular,
                                letterSpacing: 0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
