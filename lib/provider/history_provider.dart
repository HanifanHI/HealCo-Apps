import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/delete_history_model.dart';
import '../utils/result_state.dart';

class HistoryProvider extends ChangeNotifier {
  ApiService apiService;

  HistoryProvider({required this.apiService});

  late DeleteHistoryModel _deleteHistoryModel;
  DeleteHistoryModel get deleteHistoryModel => _deleteHistoryModel;

  late HistoryModel _historyModel;
  ResultState _resultState = ResultState.noData;
  String _message = '';

  HistoryModel get historyModel => _historyModel;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future getHistory() async {
    try {
      const String emailPref = 'EMAIL';
      const String tokenPref = 'TOKEN';

      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenPref) ?? '';
      String email = prefs.getString(emailPref) ?? '';

      _resultState = ResultState.loading;
      notifyListeners();

      final history = await apiService.history(email, token);

      if (history.status == '200') {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _historyModel = history;
      } else {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();
      return _message = '$e';
    }
  }

  Future deleteHistory(int id) async {
    try {
      const String tokenPref = 'TOKEN';

      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenPref) ?? '';

      // _resultState = ResultState.loading;
      // notifyListeners();

      final history = await apiService.deleteHistory(id, token);

      print(history);
      return _deleteHistoryModel = history;

      // if (history.data.isEmpty) {
      //   print('No Data');
      //   // _resultState = ResultState.noData;
      //   // notifyListeners();
      //   return _message = 'Empty Data';
      // } else {
      //   // _resultState = ResultState.hasData;
      //   // notifyListeners();
      //   return _historyModel = history;
      // }
    } catch (e) {
      // _resultState = ResultState.hasError;
      // notifyListeners();
      return _message = '$e';
    }
  }
}
