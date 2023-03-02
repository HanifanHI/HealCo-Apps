import 'package:flutter/material.dart';

import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/pages/main_page.dart';
import 'package:healco/provider/delete_provider.dart';
import 'package:healco/provider/detail_provider.dart';
import 'package:healco/provider/history_provider.dart';
import 'package:healco/provider/page_provider.dart';
import 'package:healco/utils/result_state.dart';
import 'package:healco/widgets/dialogs/hapus_dialog.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future:
            Provider.of<HistoryProvider>(context, listen: false).getHistory(),
        builder: (context, _) => Consumer<HistoryProvider>(
          builder: (context, historyProv, _) {
            if (historyProv.resultState == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: cOrangeColor,
                ),
              );
            } else if (historyProv.resultState == ResultState.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: historyProv.historyModel.data.length,
                itemBuilder: (context, index) {
                  final history = historyProv.historyModel.data[index];
                  return Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: index == historyProv.historyModel.data.length - 1
                          ? 20 + 60
                          : 0,
                    ),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer<DetailProvider>(
                          builder: (context, detailProv, _) => GestureDetector(
                            onTap: () {
                              detailProv.getDetail(history.name).then((value) {
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
                                  'https://hanifanhi.com/uploads/predict/${history.image}',
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
                                history.name.replaceAll('_', ' ').toUpperCase(),
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
                                return HapusDialog(id: history.id);
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
                child: Text(
                  historyProv.message,
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
      ),
    );
  }
}
