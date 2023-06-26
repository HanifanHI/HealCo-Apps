import 'package:flutter/material.dart';
import 'package:healco/provider/db_provider.dart';
import 'package:provider/provider.dart';
import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../config/text_styles.dart';

class HapusDialog extends StatelessWidget {
  final int id;

  const HapusDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0,
      title: Center(
        child: Image.asset(
          'assets/images/img_frowning_face.png',
          width: MediaQuery.of(context).size.height * 0.075,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Hapus Data',
            style: redTextstyle.copyWith(
              fontSize: MediaQuery.of(context).size.height * 0.022,
              fontWeight: semiBold,
              letterSpacing: 0.4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Apakah yakin ingin hapus?',
            style: grayTextstyle.copyWith(
              fontSize: MediaQuery.of(context).size.height * 0.018,
              fontWeight: regular,
              letterSpacing: 0.2,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Consumer<DatabaseProvider>(
                builder: (context, dbProvider, _) => GestureDetector(
                  onTap: () {
                    dbProvider.deleteHistory(id);
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: cWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: cRedColor, width: 2),
                    ),
                    child: Text(
                      'Ya',
                      style: redTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: medium,
                        letterSpacing: 0.4,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: cGreenColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Tidak',
                    style: whiteTextstyle.copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: medium,
                        letterSpacing: 0.4),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
