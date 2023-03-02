import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  // NOTE : AUTO LOGIN
  Future autoLogin() async {
    final sharedPref = await SharedPreferences.getInstance();

    const String tokenPref = 'TOKEN';

    if (!sharedPref.containsKey(tokenPref)) {
      return false;
    }

    final token = sharedPref.getString(tokenPref);

    print(token);

    final jwt = JWT.decode(token!);
    var datatime = jwt.payload['sub'];

    print(jwt);

    final inputFormat = DateFormat('EEE, dd MMM yyyy HH:mm:ss \'GMT\'');
    final inputDate = inputFormat.parse(datatime['exp']);

    // final Duration difference = inputDate.difference(DateTime.now());
    // print(difference.inDays);

    // NOTE : JIKA EXP MAKA HARUS LOGIN KEMBALI
    if (inputDate.isBefore(DateTime.now())) {
      return false;
    }
    return true;
  }
}
