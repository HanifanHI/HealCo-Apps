import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/register_model.dart';

import '../utils/result_state.dart';

class RegisterProvider extends ChangeNotifier {
  ApiService apiService;

  RegisterProvider({required this.apiService});

  late RegisterModel _registerModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  RegisterModel get registerModel => _registerModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  setResultState(ResultState state) {
    _resultState = state;
    notifyListeners();
  }

  Future postRegister(
      String name, String email, String noHp, String password) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      final register = await apiService.register(name, email, noHp, password);

      if (register.status == '200') {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _registerModel = register;
      } else {
        _resultState == ResultState.noData;
        notifyListeners();
        return _message = 'Gagal menambahkan data';
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      return _message = '$e';
    }
  }
}
