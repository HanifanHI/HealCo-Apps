import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';
import 'package:healco/config/font_weight.dart';
import 'package:healco/config/text_styles.dart';

class DiseaseList extends StatefulWidget {
  const DiseaseList({super.key});

  static const String routeName = '/disease';

  @override
  State<DiseaseList> createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: cGrayLightColor,
        title: Text(
          'Daftar Penyakit',
          style: blackTextstyle.copyWith(
            fontSize: MediaQuery.of(context).size.height * 0.026,
            fontWeight: medium,
            letterSpacing: 0.4,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
                color: cOrangeColor,
                alignment: Alignment.center,
                child: TextField(
                  autofocus: false,
                  autocorrect: false,
                  cursorColor: cBlackColor,
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                  maxLines: 1,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SizedBox(),
      ),
    );
  }
}
