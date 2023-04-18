import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';

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
            width: MediaQuery.of(context).size.height * 0.15,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
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
                  title,
                  style: blackTextstyle.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: bold,
                    letterSpacing: 1,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subTitle,
                  style: grayTextstyle.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: regular,
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
    );
  }
}
