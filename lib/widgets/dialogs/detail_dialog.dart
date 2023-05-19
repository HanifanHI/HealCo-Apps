import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../config/text_styles.dart';

class DetailDialog extends StatelessWidget {
  final String subTitle;

  const DetailDialog({
    super.key,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(
        child: Image.asset(
          'assets/images/img_dizzy_face.png',
          width: MediaQuery.of(context).size.height * 0.075,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Detail Gagal',
            style: redTextstyle.copyWith(
              fontSize: MediaQuery.of(context).size.height * 0.022,
              fontWeight: semiBold,
              letterSpacing: 0.4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            style: grayTextstyle.copyWith(
              fontSize: MediaQuery.of(context).size.height * 0.018,
              fontWeight: regular,
              letterSpacing: 0.2,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: cGreenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Kembali',
              style: whiteTextstyle.copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: medium,
                letterSpacing: 0.4,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
