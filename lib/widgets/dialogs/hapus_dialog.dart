import 'package:flutter/material.dart';
import 'package:healco/provider/history_provider.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../config/text_styles.dart';
import '../../pages/main_page.dart';
import '../../provider/page_provider.dart';

class HapusDialog extends StatelessWidget {
  final int id;

  const HapusDialog({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
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
              child: Consumer<HistoryProvider>(
                builder: (context, historyProv, _) => GestureDetector(
                  onTap: () {
                    historyProv.deleteHistory(id).then((value) {
                      Navigator.pop(context);
                      Provider.of<HistoryProvider>(context, listen: false)
                          .getHistory();
                    });

                    // historyProv.getHistory().then((value) {
                    //   Navigator.pushNamedAndRemoveUntil(
                    //       context, MainPage.routeName, (route) => false);
                    // });
                    // pageValue.setPage(1);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20, right: 15),
                    height: 40,
                    decoration: BoxDecoration(
                      color: cWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: cRedColor,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'Ya',
                      style: redTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                        letterSpacing: 1,
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
                  margin: const EdgeInsets.only(right: 20, left: 15),
                  height: 40,
                  decoration: BoxDecoration(
                      color: cOrangeColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Tidak',
                    style: whiteTextstyle.copyWith(
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
  }
}
