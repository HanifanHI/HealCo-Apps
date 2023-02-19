import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../config/colors.dart';
import '../data/models/detail_model.dart';
import '../pages/main_page.dart';
import '../provider/page_provider.dart';

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
    var data = ModalRoute.of(context)!.settings.arguments as DetailModel;

    return SafeArea(
      child: Scaffold(
        backgroundColor: cWhiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: cWhiteColor,
          leading: Center(
            child: Consumer<PageProvider>(
              builder: (context, value, _) => GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, MainPage.routeName, (route) => false);
                  value.page == 0;
                },
                child: Image.asset(
                  'assets/icons/ic_arrow_left_black.png',
                  width: 26,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
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
                      items: List.generate(data.gambar.length, (index) {
                        return Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              'https://healco.hanifanhi.com/uploads/disease/${data.gambar[index]}',
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
                  data.nama.replaceAll('_', ' ').toUpperCase(),
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
                    fontWeight: semiBold,
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
                  data.deskripsi,
                  style: grayTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    letterSpacing: 1,
                  ),
                  trimLines: 4,
                  colorClickableText: cOrangeColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Lebih Banyak',
                  trimExpandedText: 'Lebih Sedikit',
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
                    fontWeight: semiBold,
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
                  data.gejala,
                  style: grayTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    letterSpacing: 1,
                  ),
                  trimLines: 4,
                  colorClickableText: cOrangeColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Lebih Banyak',
                  trimExpandedText: 'Lebih Sedikit',
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
                    fontWeight: semiBold,
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
                  data.pengobatan,
                  style: grayTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    letterSpacing: 1,
                  ),
                  trimLines: 4,
                  colorClickableText: cOrangeColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Lebih Banyak',
                  trimExpandedText: 'Lebih Sedikit',
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
        ),
      ),
    );
  }
}
