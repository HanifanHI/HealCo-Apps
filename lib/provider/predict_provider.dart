import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/predict_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/result_state.dart';

class PredictProvider extends ChangeNotifier {
  ApiService apiService;

  PredictProvider({required this.apiService});

  late PredictModel _predictModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  PredictModel get predictModel => _predictModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  setResultState(ResultState state) {
    _resultState = state;
    notifyListeners();
  }

  Future postPredict(String image) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      const String tokenPref = 'TOKEN';

      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenPref) ?? '';

      print(token);

      final data = await apiService.predict(image, token);

      print(data.status);
      print(data.message);
      if (data.status == '200') {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _predictModel = data;
      } else {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Silahkan Coba Ulangi Lagi';
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      print('diekseksi');
      return _message = '$e';
    }
  }
}
