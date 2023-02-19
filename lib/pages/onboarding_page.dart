import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healco/pages/home_page.dart';
import 'package:healco/pages/login_page.dart';
import 'package:healco/pages/main_page.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import 'detail_page.dart';
import '../widgets/onboarding_item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static const routeName = '/onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  Widget _buildOnboarding() {
    return CarouselSlider(
      carouselController: _controller,
      items: const [
        OnboardingItem(
          imageUrl: 'assets/images/img_onboarding_1.png',
          title: 'Identifikasi',
          subTitle:
              'Ambil gambar tanaman jagung anda dan lakukan pemeriksaan kesehatannya dengan mudah dan cepat',
        ),
        OnboardingItem(
          imageUrl: 'assets/images/img_onboarding_2.png',
          title: 'Diagnosis',
          subTitle:
              'Lihat diagnosis penyakit yang diberikan dan segera melakukan penangannya dengan tepat',
        ),
        OnboardingItem(
          imageUrl: 'assets/images/img_onboarding_3.png',
          title: 'Pengobatan',
          subTitle:
              'Lihat informasi pengobatan yang disarankan dan rawat tanaman jagung anda dengan baik',
        ),
      ],
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        initialPage: _currentIndex,
        onPageChanged: (index, _) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                _controller.animateToPage(2);
              },
              child: Text(
                'SKIP',
                style: whiteTextstyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == 0 ? cOrangeColor : cWhiteColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == 1 ? cOrangeColor : cWhiteColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == 2 ? cOrangeColor : cWhiteColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_currentIndex == 2) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginPage.routeName,
                    (route) => false,
                  );
                } else {
                  _controller.nextPage();
                }
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: cOrangeColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/ic_arrow_right.png',
                    width: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOnboarding(),
          _buildCarousel(context),
        ],
      ),
    );
  }
}
