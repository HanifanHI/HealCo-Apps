// import 'package:flutter/material.dart';
// import 'package:healco/data/api/api_service.dart';
// import 'package:healco/data/models/delete_history_model.dart';
// import 'package:healco/data/models/detail_model.dart';
// import 'package:healco/data/models/history_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../utils/result_state.dart';

// class DeleteHistoryProvider extends ChangeNotifier {
//   ApiService apiService;

//   DeleteHistoryProvider({required this.apiService});

//   late DeleteHistoryModel _deleteHistoryModel;
//   // late ResultState _resultState;
//   String _message = '';

//   DeleteHistoryModel get deleteHistoryModel => _deleteHistoryModel;
//   // ResultState get resultState => _resultState;
//   String get message => _message;

//   Future deleteHistory(int id) async {
//     try {
//       const String tokenPref = 'TOKEN';

//       final prefs = await SharedPreferences.getInstance();
//       String token = prefs.getString(tokenPref) ?? '';

//       print('Token : $token');

//       // _resultState = ResultState.loading;
//       // notifyListeners();

//       final history = await apiService.deleteHistory(id, token);

//       print(history);
//       return _deleteHistoryModel = history;

//       // if (history.data.isEmpty) {
//       //   print('No Data');
//       //   // _resultState = ResultState.noData;
//       //   // notifyListeners();
//       //   return _message = 'Empty Data';
//       // } else {
//       //   // _resultState = ResultState.hasData;
//       //   // notifyListeners();
//       //   return _historyModel = history;
//       // }
//     } catch (e) {
//       // _resultState = ResultState.hasError;
//       // notifyListeners();
//       return _message = 'Error $e';
//     }
//   }
// }
