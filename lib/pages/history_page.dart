import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/pages/main_page.dart';
import 'package:healco/provider/auth_provider.dart';
import 'package:healco/provider/delete_provider.dart';
import 'package:healco/provider/detail_provider.dart';
import 'package:healco/provider/history_provider.dart';
import 'package:healco/provider/page_provider.dart';
import 'package:provider/provider.dart';

import '../utils/result_state.dart';
import 'detail_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  static const routeName = '/history';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cWhiteColor,
        elevation: 1,
        title: Text(
          'Riwayat',
          style: blackTextstyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Consumer<HistoryProvider>(builder: (context, historyProv, _) {
        return FutureBuilder(
          future: historyProv.getHistory(),
          builder: (context, snapshot) {
            print(snapshot.error);
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('Loading Dieksekusi');
              return const Center(
                child: CircularProgressIndicator(
                  color: cOrangeColor,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                print('HasData dieksekusi');
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: historyProv.historyModel.data.length,
                  itemBuilder: (context, index) {
                    final history = historyProv.historyModel.data[index];
                    print(history.image);
                    return Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom:
                            index == historyProv.historyModel.data.length - 1
                                ? 20 + 60
                                : 0,
                      ),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<DetailProvider>(
                            builder: (context, detailProv, _) =>
                                GestureDetector(
                              onTap: () async {
                                await detailProv
                                    .getDetail(history.name)
                                    .then((value) {
                                  Navigator.pushNamed(
                                    context,
                                    DetailPage.routeName,
                                    arguments: detailProv.detailModel,
                                  );
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: cGrayColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://healco.hanifanhi.com/uploads/predict/${history.image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  history.name
                                      .replaceAll('_', ' ')
                                      .toUpperCase(),
                                  style: blackTextstyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${history.accuracy} %',
                                  style: grayTextstyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    elevation: 2,
                                    title: Center(
                                      child: Image.asset(
                                        'assets/images/img_frowning_face.png',
                                        width: 70,
                                      ),
                                    ),
                                    children: [
                                      Center(
                                        child: Text(
                                          'Hapus Data',
                                          style: redTextstyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: semiBold,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          'Apakah anda yakin mau hapus?',
                                          style: grayTextstyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: medium,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child:
                                                Consumer<DeleteHistoryProvider>(
                                              builder:
                                                  (context, deleteHis, _) =>
                                                      Consumer<PageProvider>(
                                                builder:
                                                    (context, pageValue, _) =>
                                                        GestureDetector(
                                                  onTap: () async {
                                                    await deleteHis
                                                        .deleteHistory(
                                                            history.id);
                                                    historyProv
                                                        .getHistory()
                                                        .then((value) {
                                                      Navigator
                                                          .pushNamedAndRemoveUntil(
                                                              context,
                                                              MainPage
                                                                  .routeName,
                                                              (route) => false);
                                                      pageValue.page == 2;
                                                    });
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 15),
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: cWhiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: cRedColor,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Ya',
                                                      style:
                                                          redTextstyle.copyWith(
                                                        fontSize: 14,
                                                        fontWeight: semiBold,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin: const EdgeInsets.only(
                                                    right: 20, left: 15),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: cOrangeColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  'Tidak',
                                                  style:
                                                      whiteTextstyle.copyWith(
                                                    fontSize: 14,
                                                    fontWeight: semiBold,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: cRedColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/ic_trash.png',
                                  width: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Material(
                    child: Text(
                      snapshot.error.toString(),
                      style: redTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: Material(
                  child: Text(
                    snapshot.error.toString(),
                    style: redTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
