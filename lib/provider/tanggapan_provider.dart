import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/detail_model.dart';
import 'package:healco/data/models/login_model.dart';
import 'package:healco/data/models/predict_result_model.dart';
import 'package:healco/data/models/tanggapan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/result_state.dart';

class TanggapanProvider extends ChangeNotifier {
  ApiService apiService;

  TanggapanProvider({required this.apiService});

  late TanggapanModel _tanggapanModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  TanggapanModel get tanggapanModel => _tanggapanModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future postTanggapan(String tanggapan) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      const String tokenPref = 'TOKEN';

      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenPref) ?? '';

      print('Token : $token');

      final data = await apiService.tanggapan(tanggapan, token);

      print(data);

      if (data.error == 'false') {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _tanggapanModel = data;
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
