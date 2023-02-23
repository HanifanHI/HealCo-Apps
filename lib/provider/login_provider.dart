import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/result_state.dart';

class LoginProvider extends ChangeNotifier {
  ApiService apiService;

  late String _token;
  String get token => _token;
  static const String tokenPref = 'TOKEN';

  late String _email;
  String get email => _email;
  static const String emailPref = 'EMAIL';

  LoginProvider({required this.apiService});

  late LoginModel _loginModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  LoginModel get loginModel => _loginModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future postLogin(String email, String password) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      final data = await apiService.login(email, password);

      print(data.status);

      if (data.status == '400') {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _resultState = ResultState.hasData;
        _token = data.token;
        _email = data.email;
        notifyListeners();
        print('Dieksekusi');
        _saveToken();
        return _loginModel = data;
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      return _message = 'Error $e';
    }
  }

  // NOTE : FUNGSI UNTUK MENYIMPAN DATA KE DALAM SHARED PREFERENCES
  void _saveToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenPref, _token);
    prefs.setString(emailPref, _email);
  }

  Future<void> logout() async {
    _token = '';
    _email = '';
    print('Logout');

    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();

    notifyListeners();
  }
}
