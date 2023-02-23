import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/detail_model.dart';
import 'package:healco/data/models/login_model.dart';
import 'package:healco/data/models/predict_result_model.dart';
import 'package:healco/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/result_state.dart';

class UserProvider extends ChangeNotifier {
  ApiService apiService;

  UserProvider({required this.apiService});

  late UserModel _userModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  UserModel get userModel => _userModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future getUser() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      const String tokenPref = 'TOKEN';
      const String emailPref = 'EMAIL';

      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenPref) ?? '';
      String email = prefs.getString(emailPref) ?? '';

      print('Token : $token');

      final data = await apiService.user(email, token);

      print(data);

      if (data.error == 'false') {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _userModel = data;
      } else {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      return _message = 'Error $e';
    }
  }
}
