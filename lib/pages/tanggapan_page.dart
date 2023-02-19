import 'package:flutter/material.dart';
import 'package:healco/pages/main_page.dart';
import 'package:healco/provider/auth_provider.dart';
import 'package:healco/provider/page_provider.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';

class TanggapanPage extends StatefulWidget {
  const TanggapanPage({super.key});

  static const routeName = '/tanggapan';

  @override
  State<TanggapanPage> createState() => _TanggapanPageState();
}

class _TanggapanPageState extends State<TanggapanPage> {
  final GlobalKey<FormState> keyTanggapan = GlobalKey<FormState>();

  final _tanggapanController = TextEditingController();

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
          'Tanggapan',
          style: blackTextstyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggapan Anda :',
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: keyTanggapan,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                      controller: _tanggapanController,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'Berikan tanggapan anda...',
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Consumer<AuthProvider>(
              builder: (context, authValue, _) => GestureDetector(
                onTap: () {
                  final FormState? form = keyTanggapan.currentState;

                  if (form!.validate()) {
                    authValue
                        .tanggapan(_tanggapanController.text)
                        .then((value) {
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
                                  'Tanggapan Terkirim',
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
                                  'Terima kasih tanggapan anda kami terima',
                                  style: grayTextstyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: regular,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Consumer<PageProvider>(
                                builder: (context, pageValue, _) =>
                                    GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      MainPage.routeName,
                                      (route) => false,
                                    );
                                    pageValue.page == 2;
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
                                      'Ok',
                                      style: whiteTextstyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: semiBold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: cOrangeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Kirim',
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
          ],
        ),
      ),
    );
  }
}
