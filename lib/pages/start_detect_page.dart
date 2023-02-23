import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/data/models/detail_model.dart';
import 'package:healco/data/models/predict_result_model.dart';
import 'package:healco/provider/auth_provider.dart';
import 'package:healco/provider/detail_provider.dart';
import 'package:healco/provider/predict_provider.dart';
import 'package:healco/utils/result_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';

class StartDetectPage extends StatefulWidget {
  const StartDetectPage({super.key});

  static const routeName = '/start_detect';

  @override
  State<StartDetectPage> createState() => StartDetectPageState();
}

class StartDetectPageState extends State<StartDetectPage> {
  String? basegambar;

  Future imageToBase64(XFile image) async {
    Uint8List imagebytes = await image.readAsBytes();
    String base64string = base64.encode(imagebytes);
    return base64string;
  }

  PredictResultModel? dataPredict;
  DetailModel? dataDetail;

  String? token;

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as XFile;

    return SafeArea(
      child: Scaffold(
        backgroundColor: cWhiteColor,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: cWhiteColor,
          leading: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/ic_arrow_left_black.png',
                width: 26,
              ),
            ),
          ),
        ),
        body: Consumer<PredictProvider>(
          builder: (context, predictProv, _) => SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'DIAGNOSIS',
                  style: blackTextstyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 300,
                      decoration: BoxDecoration(
                        color: cGrayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(data.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 300,
                      decoration: BoxDecoration(
                        color: dataPredict != null
                            ? Colors.black.withOpacity(0.5)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: dataPredict != null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'AKURASI :',
                                  style: whiteTextstyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: medium,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ' ${dataPredict!.probability} %',
                                  style: whiteTextstyle.copyWith(
                                    fontSize: 32,
                                    fontWeight: bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                dataPredict != null
                    ? Text(
                        dataPredict!.diagnosis
                            .replaceAll('_', ' ')
                            .toUpperCase(),
                        style: blackTextstyle.copyWith(
                          fontSize: 24,
                          fontWeight: bold,
                          letterSpacing: 1,
                        ),
                      )
                    : const SizedBox(),
                dataPredict != null
                    ? Consumer<DetailProvider>(
                        builder: (context, detailProv, _) => GestureDetector(
                          onTap: () {
                            detailProv
                                .getDetail(dataPredict!.diagnosis)
                                .then((value) {
                              if (detailProv.resultState ==
                                  ResultState.hasData) {
                                Navigator.pushNamed(
                                  context,
                                  DetailPage.routeName,
                                  arguments: detailProv.detailModel,
                                );
                              } else {
                                const SizedBox();
                              }
                            });
                            // authValue
                            //     .detailPredict(dataPredict!.diagnosis)
                            //     .then((value) {
                            //   setState(() {
                            //     dataDetail = value;
                            //   });
                            // Navigator.pushNamed(
                            //   context,
                            //   DetailPage.routeName,
                            //   arguments: dataPredict!.diagnosis,
                            // );
                            // });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: cOrangeColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                'Lihat Detail',
                                style: whiteTextstyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          await imageToBase64(data).then((value) {
                            setState(() {
                              basegambar = value;
                            });
                          });

                          predictProv.postPredict(basegambar!).then((value) {
                            if (predictProv.resultState ==
                                ResultState.hasData) {
                              dataPredict = predictProv.predictModel;
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
                                          'Prediksi Gagal',
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
                                          'Coba Ulangi Lagi!',
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
                                            'Kembali',
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

                          // authValue.predict(basegambar!).then((value) {
                          //   setState(() {
                          //     dataPredict = value;
                          //   });
                          // });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: cOrangeColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child:
                                predictProv.resultState == ResultState.loading
                                    ? const CircularProgressIndicator(
                                        color: cWhiteColor,
                                      )
                                    : Text(
                                        'Mulai Deteksi',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: semiBold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
