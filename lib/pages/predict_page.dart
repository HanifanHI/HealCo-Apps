import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';
import 'package:healco/data/models/predict_model.dart';
import 'package:healco/pages/main_page.dart';
import 'package:healco/pages/scanning.dart';
import 'package:healco/provider/detail_provider.dart';
import 'package:healco/provider/page_provider.dart';
import 'package:healco/provider/predict_provider.dart';
import 'package:healco/utils/result_state.dart';
import 'package:healco/widgets/dialogs/predict_dialog.dart';
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
  Future imageToBase64(XFile image) async {
    Uint8List imagebytes = await image.readAsBytes();
    String base64string = base64.encode(imagebytes);
    return base64string;
  }

  PredictModel? dataPredict;

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as XFile;
    return SafeArea(
      child: Scaffold(
        backgroundColor: cWhiteColor,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.09 +
                  MediaQuery.of(context).padding.top,
              minHeight: MediaQuery.of(context).size.height * 0.09 +
                  MediaQuery.of(context).padding.top,
              maxWidth: MediaQuery.of(context).size.width,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: AppBar(
              elevation: 1,
              backgroundColor: cWhiteColor,
              leading: Center(
                child: Consumer<PageProvider>(
                  builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        MainPage.routeName,
                        (route) => false,
                      );
                      value.setPage(0);
                    },
                    child: Image.asset(
                      'assets/icons/ic_arrow_left_black.png',
                      width: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                ),
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
                    fontSize: MediaQuery.of(context).size.height * 0.035,
                    fontWeight: bold,
                    letterSpacing: 1,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.4,
                        minHeight: MediaQuery.of(context).size.height * 0.4,
                        maxWidth: MediaQuery.of(context).size.width * 0.6,
                        minWidth: MediaQuery.of(context).size.width * 0.6,
                      ),
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.7,
                        // height: MediaQuery.of(context).size.width * 0.75,
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
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.4,
                        minHeight: MediaQuery.of(context).size.height * 0.4,
                        maxWidth: MediaQuery.of(context).size.width * 0.6,
                        minWidth: MediaQuery.of(context).size.width * 0.6,
                      ),
                      child: predictProv.resultState == ResultState.loading
                          ? const CustomScanning(
                              child: SizedBox(),
                            )
                          : Container(
                              // width: MediaQuery.of(context).size.width * 0.7,
                              // height: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                color: dataPredict != null
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: dataPredict != null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'AKURASI :',
                                          style: whiteTextstyle.copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.035,
                                            fontWeight: medium,
                                            letterSpacing: 1,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '${dataPredict!.probability} %',
                                          style: whiteTextstyle.copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            fontWeight: bold,
                                            letterSpacing: 1,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                dataPredict != null
                    ? Text(
                        dataPredict!.diagnosis.replaceAll('_', ' '),
                        style: blackTextstyle.copyWith(
                          fontSize: MediaQuery.of(context).size.height * 0.035,
                          fontWeight: bold,
                          letterSpacing: 1,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    : const SizedBox(),
                dataPredict != null
                    ? Consumer<DetailProvider>(
                        builder: (context, detailProv, _) => ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.125,
                            maxWidth: MediaQuery.of(context).size.width,
                            minHeight:
                                MediaQuery.of(context).size.height * 0.125,
                            minWidth: MediaQuery.of(context).size.width,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              detailProv
                                  .getDetail(dataPredict!.diagnosis)
                                  .then((_) {
                                Navigator.pushNamed(
                                  context,
                                  DetailPage.routeName,
                                );
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              // width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: cOrangeColor,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height *
                                        0.15 /
                                        2),
                              ),
                              child: Center(
                                child: detailProv.resultState ==
                                        ResultState.loading
                                    ? Container(
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        child: const CircularProgressIndicator(
                                          color: cWhiteColor,
                                        ),
                                      )
                                    : Text(
                                        'Lihat Detail',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          fontWeight: bold,
                                          letterSpacing: 1,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.125,
                          minHeight: MediaQuery.of(context).size.height * 0.125,
                          maxWidth: MediaQuery.of(context).size.width,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await imageToBase64(data).then((baseGambar) {
                              predictProv.postPredict(baseGambar).then((value) {
                                if (predictProv.resultState ==
                                    ResultState.hasData) {
                                  setState(() {
                                    dataPredict = predictProv.predictModel;
                                  });
                                } else {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return PredictDialog(
                                        image:
                                            'assets/images/img_dizzy_face.png',
                                        title: 'Prediksi Gagal',
                                        subTitle: predictProv.message,
                                      );
                                    },
                                  );
                                }
                              });
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            // width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: cOrangeColor,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height *
                                      0.15 /
                                      2),
                            ),
                            child: Center(
                              child: predictProv.resultState ==
                                      ResultState.loading
                                  ? Container(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: const CircularProgressIndicator(
                                        color: cWhiteColor,
                                      ),
                                    )
                                  : Text(
                                      'Mulai Deteksi',
                                      style: whiteTextstyle.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.025,
                                        fontWeight: bold,
                                        letterSpacing: 1,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
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
