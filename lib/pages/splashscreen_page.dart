import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:healco/cubit/page_cubit.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/pages/main_page.dart';
import 'package:healco/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../pages/onboarding_page.dart';
import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  static const routeName = '/splashscreen';

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return Consumer<AuthProvider>(
            builder: (context, authValue, _) => FutureBuilder(
                  future: authValue.autoLogin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        color: cOrangeColor,
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return snapshot.data
                          ? const MainPage()
                          : const OnboardingPage();
                    } else {
                      return const SizedBox();
                    }
                  },
                ));
      }), (route) => false);
    });

    return Scaffold(
      backgroundColor: cOrangeColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/img_top_wave.png',
                width: double.infinity,
              ),
              Image.asset(
                'assets/images/img_bot_wave.png',
                width: double.infinity,
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/ic_logo.png',
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'HealCo',
                  style: whiteTextstyle.copyWith(
                    fontSize: 36,
                    fontWeight: extraBold,
                    letterSpacing: 5,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Corn disease detection'.toUpperCase(),
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    letterSpacing: 3,
                    color: cWhiteColor,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
