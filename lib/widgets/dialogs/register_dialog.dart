import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../config/text_styles.dart';

class RegisterDialog extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final void Function() onTap;

  const RegisterDialog({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.onTap,
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
            style: orangeTextstyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              content,
              style: grayTextstyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            decoration: BoxDecoration(
                color: cOrangeColor, borderRadius: BorderRadius.circular(10)),
            child: Text(
              'Ok',
              style: whiteTextstyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
