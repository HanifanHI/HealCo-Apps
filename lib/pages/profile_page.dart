import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';
import 'package:healco/pages/bantuan_page.dart';
import 'package:healco/pages/edit_profile.dart';
import 'package:healco/pages/login_page.dart';
import 'package:healco/pages/tanggapan_page.dart';
import 'package:healco/provider/auth_provider.dart';
import 'package:healco/provider/login_provider.dart';
import 'package:healco/provider/user_provider.dart';
import 'package:healco/utils/result_state.dart';
import 'package:provider/provider.dart';

import '../config/font_weight.dart';
import '../config/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        backgroundColor: cWhiteColor,
        elevation: 1,
        title: Text(
          'Profil',
          style: blackTextstyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProv, _) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userProv.resultState == ResultState.loading
                  ? const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: cOrangeColor,
                        ),
                      ),
                    )
                  : userProv.resultState == ResultState.hasData
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 24),
                          width: double.infinity,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  'https://healco.hanifanhi.com/uploads/profile/${userProv.userModel.profile}',
                                  width: 60,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userProv.userModel.name,
                                    style: blackTextstyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: medium,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    userProv.userModel.email,
                                    style: grayTextstyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Akun',
                  style: orangeTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: cGrayColor.withOpacity(0.1),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      EditProfile.routeName,
                      arguments: userProv.userModel,
                    );
                  },
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/ic_gallery_black.png',
                                width: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Edit Profile',
                                style: blackTextstyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: regular,
                                  letterSpacing: 1,
                                ),
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
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Menu Lain',
                  style: orangeTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: cGrayColor.withOpacity(0.1),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TanggapanPage.routeName,
                        );
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/ic_edit.png',
                                    width: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Tanggapan',
                                    style: blackTextstyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: regular,
                                      letterSpacing: 1,
                                    ),
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
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          BantuanPage.routeName,
                        );
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/ic_info_black.png',
                                    width: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Bantuan',
                                    style: blackTextstyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: regular,
                                      letterSpacing: 1,
                                    ),
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
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              elevation: 2,
                              title: Center(
                                child: Image.asset(
                                  'assets/images/img_frowning_face.png',
                                  width: 70,
                                ),
                              ),
                              children: [
                                Center(
                                  child: Text(
                                    'Logout',
                                    style: redTextstyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    'Apakah anda yakin mau keluar?',
                                    style: grayTextstyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Consumer<LoginProvider>(
                                        builder: (context, loginProv, child) =>
                                            GestureDetector(
                                          onTap: () async {
                                            await loginProv.logout().then((_) {
                                              Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                LoginPage.routeName,
                                                (route) => false,
                                              );
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(
                                                left: 20, right: 15),
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: cWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: cRedColor,
                                                width: 2,
                                              ),
                                            ),
                                            child: Text(
                                              'Ya',
                                              style: redTextstyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: semiBold,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                              right: 20, left: 15),
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: cOrangeColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            'Tidak',
                                            style: whiteTextstyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: semiBold,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/ic_logout.png',
                              width: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Logout',
                              style: blackTextstyle.copyWith(
                                fontSize: 16,
                                fontWeight: regular,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
