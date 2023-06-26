import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/models/search_model.dart';
import '../utils/result_state.dart';

class SearchProvider extends ChangeNotifier {
  ApiService apiService;

  SearchProvider({required this.apiService});

  late SearchModel _searchModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';
  SearchModel get searchModel => _searchModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future searchDisease(String nama) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      final disease = await apiService.search(nama);

      if (disease.status == '200') {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _searchModel = disease;
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
