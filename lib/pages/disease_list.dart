import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../pages/detail_page.dart';
import '../provider/detail_provider.dart';
import '../provider/disease_provider.dart';
import '../provider/search_provider.dart';
import '../utils/result_state.dart';
import '../widgets/dialogs/detail_dialog.dart';

class DiseaseList extends StatefulWidget {
  const DiseaseList({super.key});

  static const String routeName = '/disease';

  @override
  State<DiseaseList> createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  final TextEditingController _searchController = TextEditingController();

  PreferredSizeWidget _appBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: cWhiteColor,
      title: Text(
        'Daftar Penyakit',
        style: blackTextstyle.copyWith(
          fontSize: MediaQuery.of(context).size.height * 0.026,
          fontWeight: medium,
          letterSpacing: 0.4,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // NOTE : SEARCH
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: cGrayLightColor2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/ic_search.png',
                        width: 24,
                        // width: MediaQuery.of(context).size.height * 0.04,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      // height: MediaQuery.of(context).size.height * 0.07,
                      // padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: cGrayLightColor2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Consumer<SearchProvider>(
                        builder: (context, searchProv, _) => Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                autofocus: false,
                                autocorrect: false,
                                cursorColor: cBlackColor,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                onSubmitted: (value) {
                                  searchProv.searchDisease(value);
                                },
                                // onChanged: (value) {
                                //   searchProv.searchDisease(value);
                                // },
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Cari penyakit jagung',
                                  hintMaxLines: 1,
                                  hintStyle: grayTextstyle.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontWeight: medium,
                                    letterSpacing: 0.2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  _searchController.clear();
                                  setState(() {
                                    _searchController.text == '';
                                  });
                                },
                                child: Image.asset(
                                  'assets/icons/ic_close.png',
                                  width: 24,
                                  // width:
                                  //     MediaQuery.of(context).size.height * 0.04,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // NOTE : BODY SEARCH
            Consumer<SearchProvider>(
              builder: (context, value, _) => _searchController.text.isEmpty
                  ? Consumer<DiseaseProvider>(
                      builder: (context, diseaseProvider, _) {
                        if (diseaseProvider.resultState ==
                            ResultState.loading) {
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
                        } else if (diseaseProvider.resultState ==
                            ResultState.hasData) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                              padding: const EdgeInsets.all(20),
                              itemCount:
                                  diseaseProvider.diseaseModel.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemBuilder: (context, index) =>
                                  Consumer<DetailProvider>(
                                builder: (context, detailProv, _) =>
                                    GestureDetector(
                                  onTap: () {
                                    detailProv
                                        .getDetail(diseaseProvider
                                            .diseaseModel.data[index].nama)
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                '${diseaseProvider.apiService.baseUrl}/uploads/disease/${diseaseProvider.diseaseModel.data[index].gambar[0]}',
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            diseaseProvider
                                                .diseaseModel.data[index].nama
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
                                          const SizedBox(height: 2),
                                          Text(
                                            diseaseProvider
                                                .diseaseModel.data[index].jenis,
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
                                    diseaseProvider.message,
                                    style: redTextstyle.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
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
                                      await diseaseProvider.getDisease();
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/ic_refresh.png',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Refresh',
                                            style: whiteTextstyle.copyWith(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
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
                    )
                  : Consumer<SearchProvider>(
                      builder: (context, searchProvider, _) {
                        if (searchProvider.resultState == ResultState.loading) {
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
                        } else if (searchProvider.resultState ==
                            ResultState.hasData) {
                          return searchProvider.searchModel.data.isEmpty
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  color: cGrayLightColor,
                                  child: Center(
                                    child: Text(
                                      'Hasil tidak ditemukan',
                                      style: grayTextstyle.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.022,
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
                                  height: MediaQuery.of(context).size.height,
                                  child: GridView.builder(
                                    padding: const EdgeInsets.all(20),
                                    itemCount:
                                        searchProvider.searchModel.data.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                    ),
                                    itemBuilder: (context, index) =>
                                        Consumer<DetailProvider>(
                                      builder: (context, detailProv, _) =>
                                          GestureDetector(
                                        onTap: () {
                                          detailProv
                                              .getDetail(searchProvider
                                                  .searchModel.data[index].nama)
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
                                                      subTitle:
                                                          detailProv.message);
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
                                              left: 5,
                                              right: 5,
                                              top: 5,
                                              bottom: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              color: cGrayLightColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: cGrayColor
                                                      .withOpacity(0.5),
                                                  offset: const Offset(2, 2),
                                                  blurRadius: 4,
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      '${searchProvider.apiService.baseUrl}/uploads/disease/${searchProvider.searchModel.data[index].gambar[0]}',
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  searchProvider.searchModel
                                                      .data[index].nama
                                                      .replaceAll('_', ' '),
                                                  style:
                                                      blackTextstyle.copyWith(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.022,
                                                    fontWeight: medium,
                                                    letterSpacing: 0,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  searchProvider.searchModel
                                                      .data[index].jenis,
                                                  style: grayTextstyle.copyWith(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.018,
                                                    fontWeight: regular,
                                                    letterSpacing: 0,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                    searchProvider.message,
                                    style: redTextstyle.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
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
                                      await searchProvider.searchDisease(
                                          _searchController.text);
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/ic_refresh.png',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Refresh',
                                            style: whiteTextstyle.copyWith(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
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
            ),
          ],
        ),
      ),
    );
  }
}
