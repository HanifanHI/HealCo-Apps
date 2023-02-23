import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  // NOTE : AUTO LOGIN
  Future autoLogin() async {
    final sharedPref = await SharedPreferences.getInstance();

    const String tokenPref = 'TOKEN';

    if (!sharedPref.containsKey(tokenPref)) {
      return false;
    }

    final myData = sharedPref.getString(tokenPref);

    final jwt = JWT.decode(myData!);
    final time = jwt.payload['exp'];

    DateTime expDateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    print(expDateTime);

    if (expDateTime.isBefore(DateTime.now())) {
      return false;
    }
    return true;
  }
}
