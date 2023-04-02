import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';

class KontakPage extends StatefulWidget {
  const KontakPage({super.key});

  static const routeName = '/kontak';

  @override
  State<KontakPage> createState() => KontakPageState();
}

class KontakPageState extends State<KontakPage> {
  String whatsappUrl = "whatsapp://send?phone=+6282325288088";

  Future<void> _launchWhatsapp() async {
    if (!await launchUrl(Uri.parse(whatsappUrl))) {
      throw 'Could not launch $whatsappUrl';
    }
  }

  String emailUrl = "mailto:hanifan.husein.i@gmail.com";

  Future<void> _launchEmail() async {
    if (!await launchUrl(Uri.parse(emailUrl))) {
      throw 'Could not launch $emailUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
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
          'Kontak',
          style: blackTextstyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: _launchWhatsapp,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_wa.png',
                          width: 40,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Whatsapp',
                              style: blackTextstyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '+62 823 2528 8088',
                              style: grayTextstyle.copyWith(
                                fontSize: 13,
                                fontWeight: medium,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/icons/ic_arrow_right_black.png',
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _launchEmail,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_email.png',
                          width: 40,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Email',
                              style: blackTextstyle.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'hanifan.husein.i@gmail.com',
                              style: grayTextstyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/icons/ic_arrow_right_black.png',
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
