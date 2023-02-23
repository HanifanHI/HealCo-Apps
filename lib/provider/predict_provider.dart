import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/login_model.dart';
import 'package:healco/data/models/predict_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/result_state.dart';

class PredictProvider extends ChangeNotifier {
  ApiService apiService;

  PredictProvider({required this.apiService});

  late PredictResultModel _predictModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  PredictResultModel get predictModel => _predictModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future postPredict(String image) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      const String tokenPref = 'TOKEN';

      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenPref) ?? '';

      print('Token : $token');

      final data = await apiService.predict(image, token);

      print(data);

      if (data.status == 200) {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _predictModel = data;
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
