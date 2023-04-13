import 'package:flutter/material.dart';
import 'package:healco/pages/main_page.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../config/text_styles.dart';
import '../../provider/predict_provider.dart';

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
          width: MediaQuery.of(context).size.width * 0.18,
        ),
      ),
      children: [
        Center(
          child: Text(
            'Hapus Data',
            style: redTextstyle.copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: bold,
              letterSpacing: 1,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            'Apakah anda yakin mau hapus?',
            style: grayTextstyle.copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: medium,
              letterSpacing: 1,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Provider.of<PredictProvider>(context, listen: false)
                      .removeHistory(id);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    MainPage.routeName,
                    (route) => false,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 15),
                  height: MediaQuery.of(context).size.height * 0.06,
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
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: bold,
                      letterSpacing: 1,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      color: cOrangeColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Tidak',
                    style: whiteTextstyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: bold,
                      letterSpacing: 1,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
