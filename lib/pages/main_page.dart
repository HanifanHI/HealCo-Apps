import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/pages/forum_page.dart';
import 'package:healco/pages/profile_page.dart';
import 'package:healco/provider/page_provider.dart';
import 'package:provider/provider.dart';

// import '../cubit/page_cubit.dart';
import 'history_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // PageProvider pageProvider = PageProvider();

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      // case 1:
      //   return const ForumPage();
      case 1:
        return const HistoryPage();
      case 2:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  Widget customBottomNavigation(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, value, child) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: cWhiteColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -1),
                color: cBlackColor.withOpacity(0.1),
                blurRadius: 10,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // NOTE : BERANDA
              GestureDetector(
                onTap: () {
                  // context.read<PageCubit>().setPage(0);
                  value.setPage(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      value.page == 0
                          ? 'assets/icons/ic_beranda_fill.png'
                          : 'assets/icons/ic_beranda.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Beranda',
                      style: value.page == 0
                          ? orangeTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                              letterSpacing: 1,
                            )
                          : blackTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                              letterSpacing: 1,
                            ),
                    ),
                  ],
                ),
              ),
              // NOTE : FORUM
              // GestureDetector(
              //   onTap: () {
              //     context.read<PageCubit>().setPage(1);
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset(
              //         value.page == 1
              //             ? 'assets/icons/ic_forum_fill.png'
              //             : 'assets/icons/ic_forum.png',
              //         width: 24,
              //         height: 24,
              //       ),
              //       const SizedBox(height: 2),
              //       Text(
              //         'Forum',
              //         style: value.page == 1
              //             ? orangeTextstyle.copyWith(
              //                 fontSize: 12,
              //                 fontWeight: regular,
              //                 letterSpacing: 1,
              //               )
              //             : blackTextstyle.copyWith(
              //                 fontSize: 12,
              //                 fontWeight: regular,
              //                 letterSpacing: 1,
              //               ),
              //       ),
              //     ],
              //   ),
              // ),
              // NOTE : RIWAYAT
              GestureDetector(
                onTap: () {
                  // context.read<PageCubit>().setPage(1);
                  value.setPage(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      value.page == 1
                          ? 'assets/icons/ic_riwayat_fill.png'
                          : 'assets/icons/ic_riwayat.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Riwayat',
                      style: value.page == 1
                          ? orangeTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                              letterSpacing: 1,
                            )
                          : blackTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                              letterSpacing: 1,
                            ),
                    ),
                  ],
                ),
              ),
              // NOTE : PROFIL
              GestureDetector(
                onTap: () {
                  // context.read<PageCubit>().setPage(2);
                  value.setPage(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      value.page == 2
                          ? 'assets/icons/ic_profil_fill.png'
                          : 'assets/icons/ic_profil.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Profil',
                      style: value.page == 2
                          ? orangeTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                              letterSpacing: 1,
                            )
                          : blackTextstyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                              letterSpacing: 1,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PageProvider>(
        builder: (context, value, child) => Stack(
          children: [
            buildContent(value.page),
            customBottomNavigation(context),
          ],
        ),
      ),
    );
  }
}
