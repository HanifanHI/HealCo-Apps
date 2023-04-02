import 'package:flutter/material.dart';

import '../../config/font_weight.dart';
import '../../config/text_styles.dart';

class ItemPenyakit extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const ItemPenyakit({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: blackTextstyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subTitle,
                style: grayTextstyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                  letterSpacing: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
