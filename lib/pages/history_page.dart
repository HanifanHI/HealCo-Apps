import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../data/api/api_service.dart';
import '../provider/db_provider.dart';
import '../utils/result_state.dart';
import '../widgets/dialogs/detail_dialog.dart';
import '../widgets/dialogs/hapus_dialog.dart';

import '../provider/detail_provider.dart';
import 'detail_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  static const routeName = '/history';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _apiService = ApiService();

  PreferredSizeWidget _appBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: cWhiteColor,
      title: Text(
        'Riwayat',
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: _appBar(),
      body: Consumer<DatabaseProvider>(
        builder: (context, dbProvider, _) {
          final histories = dbProvider.histories;
          return histories.isEmpty
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: cGrayLightColor,
                  child: Center(
                    child: Text(
                      'Tidak ada riwayat deteksi',
                      style: grayTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: regular,
                        letterSpacing: 0.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: histories.length,
                  itemBuilder: (context, index) {
                    int reverseIndex = (histories.length - 1) - index;
                    return Consumer<DetailProvider>(
                      builder: (context, detailProv, _) => GestureDetector(
                        onTap: () {
                          detailProv
                              .getDetail(histories[reverseIndex].name)
                              .then((_) {
                            if (detailProv.resultState == ResultState.hasData) {
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
                          height: MediaQuery.of(context).size.height * 0.11,
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: index == histories.length - 1
                                ? 30 + MediaQuery.of(context).size.height * 0.09
                                : 0,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  color: cGrayColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    '${_apiService.baseUrl}/uploads/predict/${histories[reverseIndex].image}',
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      histories[reverseIndex]
                                          .name
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
                                    const SizedBox(height: 4),
                                    Text(
                                      '${histories[reverseIndex].accuracy} %',
                                      style: grayTextstyle.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
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
                                                .histories[reverseIndex].id!);
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
                );
        },
      ),
    );
  }
}
