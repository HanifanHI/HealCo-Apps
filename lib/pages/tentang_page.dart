import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  static const routeName = '/tentang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cWhiteColor,
        elevation: 1,
        leading: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/icons/ic_arrow_left_black.png',
              width: 24,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Text(
          'Tentang',
          style: blackTextstyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
