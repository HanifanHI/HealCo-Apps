import 'package:flutter/material.dart';

import '../config/font_weight.dart';
import '../config/text_styles.dart';

class OnboardingItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;

  const OnboardingItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: whiteTextstyle.copyWith(
                  fontSize: 36,
                  fontWeight: bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                subTitle,
                style: whiteTextstyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 130,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
