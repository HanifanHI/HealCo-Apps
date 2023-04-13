import 'package:flutter/material.dart';

import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/provider/predict_provider.dart';
import 'package:healco/widgets/dialogs/hapus_dialog.dart';
import 'package:provider/provider.dart';

import '../provider/detail_provider.dart';
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
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.09 +
                MediaQuery.of(context).padding.top,
            minHeight: MediaQuery.of(context).size.height * 0.09 +
                MediaQuery.of(context).padding.top,
            maxWidth: MediaQuery.of(context).size.width,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: AppBar(
            backgroundColor: cWhiteColor,
            elevation: 1,
            title: Text(
              'Riwayat',
              style: blackTextstyle.copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: bold,
                letterSpacing: 1,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future:
            Provider.of<PredictProvider>(context, listen: false).getHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: cOrangeColor,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data as List;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: index == data.length - 1 ? 20 + 60 : 0,
                  ),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Consumer<DetailProvider>(
                          builder: (context, detailProv, _) => GestureDetector(
                            onTap: () {
                              detailProv
                                  .getDetail(data[index]['nama'])
                                  .then((value) {
                                Navigator.pushNamed(
                                  context,
                                  DetailPage.routeName,
                                  arguments: detailProv.detailModel,
                                );
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height: MediaQuery.of(context).size.height *
                                      0.115,
                                  decoration: BoxDecoration(
                                    color: cGrayColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // child: ClipRRect(
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   child: Image.network(
                                  //     'https://healco.hanifanhi.com/uploads/predict/${data[index]['foto']}',
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index]['nama']
                                            .replaceAll('_', ' '),
                                        style: blackTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          fontWeight: medium,
                                          letterSpacing: 1,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${data[index]['akurasi']} %',
                                        style: grayTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          fontWeight: medium,
                                          letterSpacing: 1,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return HapusDialog(id: index);
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: const BoxDecoration(
                            color: cRedColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/ic_trash.png',
                              width: MediaQuery.of(context).size.height * 0.03,
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
            return const SizedBox();
          }
        },
      ),
    );
  }
}
