import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/models/predict_model.dart';
import '../interface/predict_interface.dart';
import '../utils/result_state.dart';

class PredictProvider extends ChangeNotifier implements PredictInterface {
  ApiService apiService;

  List<Map<String, dynamic>> history = [];

  PredictProvider({required this.apiService});

  late PredictModel _predictModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  PredictModel get predictModel => _predictModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  @override
  Future postPredict(String image) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      final predict = await apiService.predict(image);

      if (predict.status == '200') {
        _resultState = ResultState.hasData;

        notifyListeners();
        return _predictModel = predict;
      } else {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Silahkan Coba Ulangi Lagi';
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      return _message = '$e';
    }
  }
}
