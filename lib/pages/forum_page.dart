import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';

import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../widgets/line.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  static const routeName = '/forum';

  _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 8),
            child: Text(
              'Forum',
              style: blackTextstyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
                letterSpacing: 1,
              ),
            ),
          ),
          const Line(),
        ],
      ),
    );
  }

  _buildBody() {
    return Center(
      child: Transform.translate(
        offset: const Offset(0, -60),
        child: Text(
          'Mohon Maaf\nFitur Ini Belum Tersedia',
          style: orangeTextstyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
            color: cOrangeColor.withOpacity(0.5),
            letterSpacing: 1,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cWhiteColor,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }
}
