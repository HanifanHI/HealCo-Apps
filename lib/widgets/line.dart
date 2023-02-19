import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Divider(
        color: cOrangeColor,
        thickness: 1,
      ),
    );
  }
}
