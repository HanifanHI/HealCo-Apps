import 'package:flutter/material.dart';

import '../data/models/disease_model.dart';
import '../data/api/api_service.dart';
import '../utils/result_state.dart';

class DiseaseProvider extends ChangeNotifier {
  ApiService apiService;

  DiseaseProvider({required this.apiService}) {
    getDisease();
  }

  late DiseaseModel _diseaseModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  DiseaseModel get diseaseModel => _diseaseModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future getDisease() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      final disease = await apiService.disease();

      if (disease.status == '200') {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _diseaseModel = disease;
      } else {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Data penyakit tidak ditemukan';
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      return _message = '$e';
    }
  }
}
