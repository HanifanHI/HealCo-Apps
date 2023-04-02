import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:healco/provider/detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../config/colors.dart';
import '../pages/main_page.dart';
import '../provider/page_provider.dart';
import '../utils/result_state.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static const routeName = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cWhiteColor,
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
                width: 26,
              ),
            ),
          ),
        ),
      ),
      body: Consumer<DetailProvider>(
        builder: (context, detailProv, _) {
          if (detailProv.resultState == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: cOrangeColor,
              ),
            );
          } else if (detailProv.resultState == ResultState.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          carouselController: _controller,
                          items: List.generate(
                              detailProv.detailModel.gambar.length, (index) {
                            return Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  'https://healco.hanifanhi.com/uploads/disease/${detailProv.detailModel.gambar[index]}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                          options: CarouselOptions(
                            viewportFraction: 0.8,
                            enlargeCenterPage: true,
                            height: double.infinity,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            initialPage: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      detailProv.detailModel.nama
                          .replaceAll('_', ' ')
                          .toUpperCase(),
                      style: blackTextstyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Deskripsi',
                      style: blackTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReadMoreText(
                      detailProv.detailModel.deskripsi,
                      style: grayTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                      trimLines: 4,
                      colorClickableText: cOrangeColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lebih Banyak',
                      trimExpandedText: ' Lebih Sedikit',
                      moreStyle: orangeTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      lessStyle: orangeTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Gejala',
                      style: blackTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReadMoreText(
                      detailProv.detailModel.gejala,
                      style: grayTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                      trimLines: 4,
                      colorClickableText: cOrangeColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lebih Banyak',
                      trimExpandedText: ' Lebih Sedikit',
                      moreStyle: orangeTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      lessStyle: orangeTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Penyebab',
                      style: blackTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReadMoreText(
                      detailProv.detailModel.penyebab,
                      style: grayTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                      trimLines: 4,
                      colorClickableText: cOrangeColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lebih Banyak',
                      trimExpandedText: ' Lebih Sedikit',
                      moreStyle: orangeTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      lessStyle: orangeTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Pengobatan',
                      style: blackTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReadMoreText(
                      detailProv.detailModel.pengobatan,
                      style: grayTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 1,
                      ),
                      trimLines: 4,
                      colorClickableText: cOrangeColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lebih Banyak',
                      trimExpandedText: ' Lebih Sedikit',
                      moreStyle: orangeTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      lessStyle: orangeTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                detailProv.message,
                style: redTextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
