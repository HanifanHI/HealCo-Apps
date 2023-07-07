import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../provider/db_provider.dart';
import '../provider/detail_provider.dart';
import '../provider/disease_provider.dart';
import '../provider/page_provider.dart';
import '../utils/result_state.dart';
import '../widgets/dialogs/detail_dialog.dart';
import '../widgets/dialogs/hapus_dialog.dart';
import '../pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // NOTE : APPBAR
  PreferredSizeWidget _appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
      child: ClipRect(
        child: AppBar(
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.21,
              color: cGrayLightColor,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: 0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(25),
                        ),
                        child: CarouselSlider(
                          items: [
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/img_banner1.png',
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        cBlackColor.withOpacity(0.75),
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Deteksi',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.024,
                                          fontWeight: semiBold,
                                          letterSpacing: 0.4,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Periksa penyakit daun jagung dengan mudah!',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018,
                                          fontWeight: regular,
                                          letterSpacing: 0.2,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/img_banner2.png',
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        cBlackColor.withOpacity(0.75),
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Diagnosis',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.024,
                                          fontWeight: semiBold,
                                          letterSpacing: 0.4,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Temukan penyakit daun jagung dengan akurat!',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018,
                                          fontWeight: regular,
                                          letterSpacing: 0.2,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/img_banner3.png',
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        cBlackColor.withOpacity(0.75),
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Pengendalian',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.024,
                                          fontWeight: semiBold,
                                          letterSpacing: 0.4,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Lihat saran pengendalian penyakit daun jagung',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018,
                                          fontWeight: regular,
                                          letterSpacing: 0.2,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                          // carouselController: _controller,
                          options: CarouselOptions(
                            initialPage: _currentIndex,
                            viewportFraction: 1,
                            autoPlay: false,
                            onPageChanged: (index, _) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // NOTE : TITLE PENYAKIT
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
                          Consumer<PageProvider>(
                            builder: (context, pageProv, child) =>
                                GestureDetector(
                              onTap: () {
                                pageProv.setPage(1);
                              },
                              child: Text(
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
                            ),
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

            // NOTE : BODY PENYAKIT
            Consumer<DiseaseProvider>(
              builder: (context, diseaseProv, _) {
                if (diseaseProv.resultState == ResultState.loading) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: cWhiteColor,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: cGreenColor,
                      ),
                    ),
                  );
                } else if (diseaseProv.resultState == ResultState.hasData) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    color: cWhiteColor,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) => Consumer<DetailProvider>(
                        builder: (context, detailProv, _) => GestureDetector(
                          onTap: () {
                            detailProv
                                .getDetail(
                                    diseaseProv.diseaseModel.data[index].nama)
                                .then((_) {
                              if (detailProv.resultState ==
                                  ResultState.hasData) {
                                Navigator.pushNamed(
                                  context,
                                  DetailPage.routeName,
                                );
                              } else {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return DetailDialog(
                                        subTitle: detailProv.message);
                                  },
                                );
                              }
                            });
                          },
                          child: Transform.translate(
                            offset: index.isOdd
                                ? const Offset(0, 10)
                                : const Offset(0, -10),
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 8,
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
                                      child: Image.network(
                                        '${diseaseProv.apiService.baseUrl}/uploads/disease/${diseaseProv.diseaseModel.data[index].gambar[0]}',
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: cGrayLightColor2,
                                            child: Center(
                                              child: Image.asset(
                                                'assets/icons/ic_alert_circle.png',
                                                width: 22,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    diseaseProv.diseaseModel.data[index].nama
                                        .replaceAll('_', ' '),
                                    style: blackTextstyle.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      fontWeight: medium,
                                      letterSpacing: 0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    diseaseProv.diseaseModel.data[index].jenis,
                                    style: grayTextstyle.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
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
                    ),
                  );
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: cGrayLightColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            diseaseProv.message,
                            style: redTextstyle.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
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
                              await diseaseProv.getDisease();
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
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Refresh',
                                    style: whiteTextstyle.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
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

            // NOTE : TITLE RIWAYAT
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
                          Consumer<PageProvider>(
                            builder: (context, pageProv, _) => GestureDetector(
                              onTap: () {
                                pageProv.setPage(3);
                              },
                              child: Text(
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
                            ),
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

            // NOTE : BODY HISTORY
            Consumer<DatabaseProvider>(
              builder: (context, dbProvider, _) {
                final histories = dbProvider.histories;
                return histories.isEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.11,
                        color: cGrayLightColor,
                        child: Center(
                          child: Text(
                            'Tidak ada riwayat deteksi',
                            style: grayTextstyle.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              fontWeight: regular,
                              letterSpacing: 0.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: histories.length == 1
                            ? MediaQuery.of(context).size.height * 0.11 + 20
                            : histories.length == 2
                                ? MediaQuery.of(context).size.height * 0.22 + 40
                                : MediaQuery.of(context).size.height * 0.33 +
                                    60,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              histories.length > 3 ? 3 : histories.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = (histories.length - 1) - index;
                            return Consumer<DetailProvider>(
                              builder: (context, detailProv, _) =>
                                  GestureDetector(
                                onTap: () {
                                  detailProv
                                      .getDetail(histories[reverseIndex].name)
                                      .then((_) {
                                    if (detailProv.resultState ==
                                        ResultState.hasData) {
                                      Navigator.pushNamed(
                                        context,
                                        DetailPage.routeName,
                                      );
                                    } else {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return DetailDialog(
                                              subTitle: detailProv.message);
                                        },
                                      );
                                    }
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                          color: cGrayColor.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            '${detailProv.apiService.baseUrl}/uploads/predict/${histories[reverseIndex].image}',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                color: cGrayLightColor2,
                                                child: Center(
                                                  child: Image.asset(
                                                    'assets/icons/ic_alert_circle.png',
                                                    width: 22,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              histories[reverseIndex]
                                                  .name
                                                  .replaceAll('_', ' '),
                                              style: blackTextstyle.copyWith(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.022,
                                                fontWeight: medium,
                                                letterSpacing: 0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              '${histories[reverseIndex].accuracy} %',
                                              style: grayTextstyle.copyWith(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
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
                                      Padding(
                                        padding: const EdgeInsets.all(7),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) {
                                                return HapusDialog(
                                                    id: dbProvider
                                                        .histories[reverseIndex]
                                                        .id!);
                                              },
                                            );
                                          },
                                          child: Image.asset(
                                            'assets/icons/ic_trash.png',
                                            width: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.12)
          ],
        ),
      ),
    );
  }
}
