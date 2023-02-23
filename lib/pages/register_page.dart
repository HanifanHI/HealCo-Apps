import 'package:flutter/material.dart';
import 'package:healco/provider/register_provider.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../pages/login_page.dart';
import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../utils/result_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nohpController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: Consumer<RegisterProvider>(
        builder: (context, register, _) => Center(
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
                        'Daftar',
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
                            width: 85,
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
                  child: Form(
                    key: myKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              return 'Nama invalid';
                            } else {
                              return null;
                            }
                          },
                          controller: _nameController,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Nama',
                            hintStyle: grayTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: regular,
                              letterSpacing: 0.8,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: cRedColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: cRedColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: cOrangeColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: cBlackColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                !RegExp(r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(value)) {
                              return 'Email invalid';
                            } else {
                              return null;
                            }
                          },
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
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: cRedColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: cRedColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: cOrangeColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: cBlackColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                                    .hasMatch(value)) {
                              return 'Nomor Hp invalid';
                            } else {
                              return null;
                            }
                          },
                          controller: _nohpController,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'No. Hp',
                            hintStyle: grayTextstyle.copyWith(
                              fontSize: 16,
                              fontWeight: regular,
                              letterSpacing: 0.8,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: cRedColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: cRedColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: cOrangeColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: cBlackColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.length < 8) {
                              return 'Password minimal 8 karakter';
                            } else {
                              return null;
                            }
                          },
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
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: cRedColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: cRedColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: cOrangeColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: cBlackColor, width: 1),
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
                          builder: (context, authValue, _) => GestureDetector(
                            onTap: () async {
                              final FormState? form = myKey.currentState;
                              if (form!.validate()) {
                                // authValue
                                //     .register(
                                //   _nameController.text,
                                //   _emailController.text,
                                //   _nohpController.text,
                                //   _passwordController.text,
                                // )
                                await register
                                    .postRegister(
                                  _nameController.text,
                                  _emailController.text,
                                  _nohpController.text,
                                  _passwordController.text,
                                )
                                    .then((value) {
                                  if (register.resultState ==
                                      ResultState.hasData) {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return SimpleDialog(
                                          elevation: 2,
                                          title: Center(
                                            child: Image.asset(
                                              'assets/images/img_relieved_face.png',
                                              width: 70,
                                            ),
                                          ),
                                          children: [
                                            Center(
                                              child: Text(
                                                'Register Berhasil',
                                                style: orangeTextstyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: semiBold,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Center(
                                              child: Text(
                                                'Silahkan login terlebih dahulu',
                                                style: grayTextstyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: regular,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                  context,
                                                  LoginPage.routeName,
                                                  (route) => false,
                                                );
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: cOrangeColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  'Ok',
                                                  style:
                                                      whiteTextstyle.copyWith(
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
                                                'Register Gagal',
                                                style: orangeTextstyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: semiBold,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Center(
                                              child: Text(
                                                register.message,
                                                style: grayTextstyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: regular,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                                register.setResultState(
                                                    ResultState.noData);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: cOrangeColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  'Ok',
                                                  style:
                                                      whiteTextstyle.copyWith(
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
                              }
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
                                    register.resultState == ResultState.loading
                                        ? const CircularProgressIndicator(
                                            color: cWhiteColor,
                                          )
                                        : Text(
                                            'Daftar',
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
                              'Sudah punya akun?',
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
                                  LoginPage.routeName,
                                  (route) => false,
                                );
                              },
                              child: Text(
                                'Login',
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
