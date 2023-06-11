import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_weight.dart';
import '../config/text_styles.dart';
import '../data/models/history_model.dart';
import '../data/models/predict_model.dart';
import '../pages/main_page.dart';
import '../pages/detail_page.dart';
// import '../pages/scanning.dart';
import '../provider/db_provider.dart';
import '../provider/detail_provider.dart';
import '../provider/page_provider.dart';
import '../provider/predict_provider.dart';
import '../utils/result_state.dart';
import '../widgets/dialogs/detail_dialog.dart';
import '../widgets/dialogs/predict_dialog.dart';

class StartDetectPage extends StatefulWidget {
  const StartDetectPage({super.key});

  static const routeName = '/start_detect';

  @override
  State<StartDetectPage> createState() => StartDetectPageState();
}

class StartDetectPageState extends State<StartDetectPage> {
  Future _imageToBase64(XFile image) async {
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
        appBar: AppBar(
          elevation: 1,
          titleSpacing: 0,
          backgroundColor: cWhiteColor,
          title: Text(
            'Deteksi',
            style: blackTextstyle.copyWith(
              fontSize: MediaQuery.of(context).size.height * 0.026,
              fontWeight: medium,
              letterSpacing: 0.4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          leading: Center(
            child: Consumer<PageProvider>(
              builder: (context, value, _) => GestureDetector(
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
                  width: MediaQuery.of(context).size.height * 0.035,
                ),
              ),
            ),
          ),
        ),
        body: Consumer<PredictProvider>(
          builder: (context, predictProv, _) => Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: cGrayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(data.path),
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: predictProv.resultState == ResultState.loading
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: cBlackColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const SizedBox(),
                              // child: const CustomScanning(
                              //   child: SizedBox(),
                              // ),
                            )
                          // ? CustomScanning(
                          //     scanningLinePadding: EdgeInsets.symmetric(
                          //       horizontal:
                          //           MediaQuery.of(context).size.width * 0.06,
                          //       vertical:
                          //           MediaQuery.of(context).size.height * 0.05,
                          //     ),
                          //     child: const SizedBox(),
                          //   )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: dataPredict != null
                                    ? Colors.black.withOpacity(0.2)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: dataPredict != null
                                  ? Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: const EdgeInsets.all(15),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: cWhiteColor.withOpacity(0.8),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    predictProv
                                                        .predictModel.diagnosis
                                                        .replaceAll('_', ' '),
                                                    style: blackTextstyle.copyWith(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.024,
                                                        fontWeight: medium,
                                                        letterSpacing: 0),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    '${predictProv.predictModel.probability}%',
                                                    style: grayTextstyle.copyWith(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                        fontWeight: regular,
                                                        letterSpacing: 0),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            predictProv.predictModel
                                                        .diagnosis ==
                                                    'Daun_Sehat'
                                                ? Image.asset(
                                                    'assets/images/img_relieved_face.png',
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                  )
                                                : predictProv.predictModel
                                                            .diagnosis ==
                                                        'Bukan_Daun_Jagung'
                                                    ? Image.asset(
                                                        'assets/images/img_dizzy_face.png',
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                      )
                                                    : Image.asset(
                                                        'assets/images/img_frowning_face.png',
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                      )
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                    ),
                  ],
                ),
              ),
              dataPredict != null
                  ? dataPredict!.diagnosis != 'Bukan_Daun_Jagung'
                      ? Consumer<DetailProvider>(
                          builder: (context, detailProv, _) => GestureDetector(
                            onTap: () {
                              detailProv
                                  .getDetail(dataPredict!.diagnosis)
                                  .then((_) {
                                if (detailProv.resultState ==
                                    ResultState.hasData) {
                                  Navigator.pushNamed(
                                    context,
                                    DetailPage.routeName,
                                  );
                                } else {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return DetailDialog(
                                          subTitle: detailProv.message);
                                    },
                                  );
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: cGreenColor,
                                borderRadius: BorderRadius.circular(10),
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
                                              0.026,
                                          fontWeight: medium,
                                          letterSpacing: 0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                              ),
                            ),
                          ),
                        )
                      : Consumer<PageProvider>(
                          builder: (context, value, _) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                MainPage.routeName,
                                (route) => false,
                              );
                              value.setPage(0);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: cGreenColor,
                                borderRadius: BorderRadius.circular(10),
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
                                        'Kembali',
                                        style: whiteTextstyle.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.026,
                                          fontWeight: medium,
                                          letterSpacing: 0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                              ),
                            ),
                          ),
                        )
                  : Consumer<DatabaseProvider>(
                      builder: (context, dbProv, child) => GestureDetector(
                        onTap: () async {
                          await _imageToBase64(data).then((baseGambar) {
                            predictProv.postPredict(baseGambar).then((_) {
                              if (predictProv.resultState ==
                                  ResultState.hasData) {
                                setState(() {
                                  dataPredict = predictProv.predictModel;
                                });

                                if (dataPredict!.diagnosis !=
                                    'Bukan_Daun_Jagung') {
                                  dbProv.addHistory(HistoryModel(
                                      name: dataPredict!.diagnosis,
                                      image: dataPredict!.image,
                                      accuracy: dataPredict!.probability));
                                }
                              } else {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return PredictDialog(
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
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: cGreenColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: predictProv.resultState ==
                                    ResultState.loading
                                ? Container(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                    width: MediaQuery.of(context).size.height *
                                        0.07,
                                    height: MediaQuery.of(context).size.height *
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
                                              0.026,
                                      fontWeight: medium,
                                      letterSpacing: 0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
