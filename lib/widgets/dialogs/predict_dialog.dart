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
          width: MediaQuery.of(context).size.width * 0.18,
        ),
      ),
      children: [
        Center(
          child: Text(
            title,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                subTitle,
                style: grayTextstyle.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: medium,
                  letterSpacing: 1,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
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
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              color: cOrangeColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Kembali',
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
      ],
    );
  }
}
