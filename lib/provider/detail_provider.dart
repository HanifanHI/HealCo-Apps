import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/detail_model.dart';
import 'package:healco/data/models/login_model.dart';
import 'package:healco/data/models/predict_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/result_state.dart';

class DetailProvider extends ChangeNotifier {
  ApiService apiService;

  DetailProvider({required this.apiService});

  late DetailModel _detailModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  DetailModel get detailModel => _detailModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future getDetail(String nama) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      const String tokenPref = 'TOKEN';

      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenPref) ?? '';

      print('Token : $token');

      final data = await apiService.detail(nama, token);

      print(data);

      if (data.error == 'false') {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _detailModel = data;
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
