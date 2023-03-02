import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/login_provider.dart';
import '../provider/page_provider.dart';
import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../pages/main_page.dart';
import '../pages/register_page.dart';
import '../utils/result_state.dart';
import '../widgets/dialogs/login_dialog.dart';

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

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: blackTextstyle.copyWith(
            fontSize: 28,
            fontWeight: bold,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 70,
              height: 5,
              decoration: BoxDecoration(
                color: cBlackColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: 10,
              height: 5,
              decoration: BoxDecoration(
                color: cBlackColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Consumer<LoginProvider>(
                        builder: (context, loginProv, _) => GestureDetector(
                          onTap: () {
                            loginProv
                                .postLogin(_emailController.text,
                                    _passwordcontroller.text)
                                .then(
                              (value) {
                                if (loginProv.resultState ==
                                    ResultState.hasData) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    MainPage.routeName,
                                    (route) => false,
                                  );
                                  Provider.of<PageProvider>(context,
                                          listen: false)
                                      .setPage(0);
                                } else {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return LoginDialog(message: value);
                                    },
                                  );
                                }
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: cOrangeColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child:
                                  loginProv.resultState == ResultState.loading
                                      ? const CircularProgressIndicator(
                                          color: cWhiteColor,
                                        )
                                      : Text(
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
      ),
    );
  }
}
