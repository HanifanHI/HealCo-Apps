import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../config/text_styles.dart';

class LoginDialog extends StatelessWidget {
  final String message;

  const LoginDialog({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 2,
      title: Center(
        child: Image.asset(
          'assets/images/img_dizzy_face.png',
          width: 70,
        ),
      ),
      children: [
        Center(
          child: Text(
            'Login Gagal',
            style: redTextstyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              message,
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
              color: cOrangeColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Login Kembali',
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
