import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api_service.dart';
import '../data/models/predict_model.dart';
import '../utils/result_state.dart';

class PredictProvider extends ChangeNotifier {
  ApiService apiService;

  List<Map<String, dynamic>> history = [];

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

      final predict = await apiService.predict(image);

      print('PREDICT $predict');

      if (predict.status == '200') {
        _resultState = ResultState.hasData;
        setHistory(predict);
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

  static const String keyHistory = 'PREDICT';

  setHistory(PredictModel data) async {
    final pref = await SharedPreferences.getInstance();

    if (pref.containsKey(keyHistory)) {
      final oldPredict = pref.getString(keyHistory);
      List oldPredictList = json.decode(oldPredict!);
      oldPredictList.add({
        'nama': data.diagnosis,
        'akurasi': data.probability,
        'foto': data.image,
      });
      pref.setString(keyHistory, json.encode(oldPredictList));
    } else {
      history.add({
        'nama': data.diagnosis,
        'akurasi': data.probability,
        'foto': data.image,
      });
      pref.setString(keyHistory, jsonEncode(history));
    }
  }

  Future getHistory() async {
    final pref = await SharedPreferences.getInstance();

    String dataHistory = pref.getString(keyHistory) ?? '';

    List<Map<String, dynamic>> myHistory = (dataHistory != '')
        ? List<Map<String, dynamic>>.from(jsonDecode(dataHistory))
        : [];
    return myHistory;
  }

  removeHistory(int index) async {
    final pref = await SharedPreferences.getInstance();

    if (pref.containsKey(keyHistory)) {
      final oldPredict = pref.getString(keyHistory);
      List oldPredictList = json.decode(oldPredict!);
      oldPredictList.removeAt(index);
      pref.setString(keyHistory, json.encode(oldPredictList));
    }
  }
}
