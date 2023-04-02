import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../config/text_styles.dart';

class PredictDialog extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const PredictDialog({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 2,
      title: Center(
        child: Image.asset(
          image,
          width: 70,
        ),
      ),
      children: [
        Center(
          child: Text(
            title,
            style: redTextstyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subTitle,
              style: grayTextstyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            decoration: BoxDecoration(
                color: cOrangeColor, borderRadius: BorderRadius.circular(10)),
            child: Text(
              'Kembali',
              style: whiteTextstyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
