import 'package:flutter/material.dart';
import 'package:healco/data/api/api_service.dart';
import 'package:healco/data/models/detail_model.dart';
import 'package:healco/data/models/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/result_state.dart';

class HistoryProvider extends ChangeNotifier {
  ApiService apiService;

  HistoryProvider({required this.apiService});

  late HistoryModel _historyModel;
  // late ResultState _resultState;
  String _message = '';

  HistoryModel get historyModel => _historyModel;
  // ResultState get resultState => _resultState;
  String get message => _message;

  Future getHistory() async {
    try {
      const String emailPref = 'EMAIL';
      const String tokenPref = 'TOKEN';

      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(tokenPref) ?? '';
      String email = prefs.getString(emailPref) ?? '';

      print('Email : $email');
      print('Token : $token');

      // _resultState = ResultState.loading;
      // notifyListeners();

      final history = await apiService.history(email, token);

      print(history);
      return _historyModel = history;

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
      return _message = 'Error $e';
    }
  }
}
