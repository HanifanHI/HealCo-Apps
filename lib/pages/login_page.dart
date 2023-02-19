import 'package:flutter/material.dart';
import 'package:healco/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api_service.dart';
import '../provider/page_provider.dart';
import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../pages/main_page.dart';
import '../pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();

  bool _hide = true;

  // ApiService service = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Login',
                      style: blackTextstyle.copyWith(
                        fontSize: 28,
                        fontWeight: bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 5,
                          decoration: BoxDecoration(
                              color: cBlackColor,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 10,
                          height: 5,
                          decoration: BoxDecoration(
                              color: cBlackColor,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: grayTextstyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                          letterSpacing: 0.8,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        // errorBorder: OutlineInputBorder(
                        //   borderSide:
                        //       const BorderSide(color: cRedColor, width: 1),
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        // focusedErrorBorder: OutlineInputBorder(
                        //   borderSide:
                        //       const BorderSide(color: cRedColor, width: 1),
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: cOrangeColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: cBlackColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordcontroller,
                      obscureText: _hide,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: grayTextstyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                          letterSpacing: 0.8,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        // errorBorder: OutlineInputBorder(
                        //   borderSide:
                        //       const BorderSide(color: cRedColor, width: 1),
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        // focusedErrorBorder: OutlineInputBorder(
                        //   borderSide:
                        //       const BorderSide(color: cRedColor, width: 1),
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: cOrangeColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: cBlackColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hide = !_hide;
                            });
                          },
                          icon: _hide
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: cGrayColor,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: cGrayColor,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Consumer<AuthProvider>(
                      builder: (context, valueAuth, _) =>
                          Consumer<PageProvider>(
                        builder: (context, valuePage, _) => GestureDetector(
                          onTap: () {
                            // valueAuth.login(_emailController.text,
                            //     _passwordcontroller.text);
                            valueAuth
                                .login(_emailController.text,
                                    _passwordcontroller.text)
                                .then((_) {
                              if (valueAuth.token != null &&
                                  valueAuth.email != null) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  MainPage.routeName,
                                  (route) => false,
                                );
                                valuePage.setPage(0);
                              } else {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
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
                                          height: 5,
                                        ),
                                        Center(
                                          child: Text(
                                            'Email atau Password Anda Salah',
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
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: cOrangeColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                                  },
                                );
                              }
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                color: cOrangeColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Login',
                                style: whiteTextstyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun?',
                          style: blackTextstyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(width: 2),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RegisterPage.routeName,
                              (route) => false,
                            );
                          },
                          child: Text(
                            'Daftar',
                            style: orangeTextstyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
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
