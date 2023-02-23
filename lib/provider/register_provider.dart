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
  setResultState(ResultState state) {
    _resultState = state;
    notifyListeners();
  }

  String get message => _message;

  Future postRegister(
      String name, String email, String noHp, String password) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      final data = await apiService.register(name, email, noHp, password);

      if (data.status == 400) {
        _resultState == ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _registerModel = data;
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      return _message = 'Error $e';
    }
  }
}
