import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/login_model.dart';
import '../data/api/api_service.dart';
import '../utils/result_state.dart';

class LoginProvider extends ChangeNotifier {
  ApiService apiService;
  static const String emailPref = 'EMAIL';
  static const String tokenPref = 'TOKEN';

  late String _token;
  late String _email;

  String get token => _token;
  String get email => _email;

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

      final login = await apiService.login(email, password);

      if (login.status == '200') {
        _resultState = ResultState.hasData;
        _token = login.token;
        _email = login.email;
        notifyListeners();
        _saveToken();
        return _loginModel = login;
      } else {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Email atau Password salah';
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      return _message = '$e';
    }
  }

  // NOTE : FUNGSI UNTUK MENYIMPAN TOKEN DAN EMAIL KE DALAM SHARED PREFERENCES
  void _saveToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenPref, _token);
    prefs.setString(emailPref, _email);
  }

  Future<void> logout() async {
    _token = '';
    _email = '';
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();
    notifyListeners();
  }
}
