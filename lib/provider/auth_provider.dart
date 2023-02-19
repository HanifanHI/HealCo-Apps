import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:healco/data/models/predict_result_model.dart';
import 'package:healco/data/models/tanggapan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../data/api/api.dart';
import '../data/models/delete_history_model.dart';
import '../data/models/detail_model.dart';
import '../data/models/login_model.dart';
import '../data/models/register_model.dart';
import '../data/models/history_model.dart';

// enum ResultState { loading, noData, hasData, error }

class AuthProvider extends ChangeNotifier {
  final apiService = Api();

  late String? _token;
  late String? _email;

  // late ResultState _state;
  // ResultState get state => _state;

  String? get token {
    if (_token != null) {
      return _token!;
    } else {
      return null;
    }
  }

  String? get email {
    if (_email != null) {
      return _email!;
    } else {
      return null;
    }
  }

  // NOTE : REGISTER
  Future register(
      String nama, String email, String noHp, String password) async {
    final url = '${apiService.baseUrl}/register';

    try {
      final response = await http.post(Uri.parse(url), body: {
        'name': nama,
        'email': email,
        'no_hp': noHp,
        'password': password
      });

      if (response.statusCode == 200) {
        final result = json.decode(response.body);

        return RegisterModel.fromJson(result);
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }

  // NOTE : LOGIN
  Future login(String email, String password) async {
    final url = '${apiService.baseUrl}/login';

    try {
      final response = await http
          .post(Uri.parse(url), body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        final result = json.decode(response.body);

        print('Response : $result ');

        _token = result['token'];
        _email = result['email'];

        final sharedPref = await SharedPreferences.getInstance();

        if (sharedPref.containsKey('myData')) {
          sharedPref.clear();
        }

        final myData = json.encode({'token': _token, 'email': _email});
        sharedPref.setString('myData', myData);

        notifyListeners();

        return LoginModel.fromJson(result);
      } else {
        _token = null;
        _email = null;
        notifyListeners();
      }
    } catch (e) {
      return e;
    }
  }

  // NOTE : AUTO LOGIN
  Future autoLogin() async {
    final sharedPref = await SharedPreferences.getInstance();

    if (!sharedPref.containsKey('myData')) {
      return false;
    }

    final myData = json.decode(sharedPref.get('myData').toString())
        as Map<String, dynamic>;

    final jwt = JWT.decode(myData['token']);
    final time = jwt.payload['exp'];
    DateTime expDateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    if (expDateTime.isBefore(DateTime.now())) {
      return false;
    }
    return true;
  }

  // NOTE : GET HISTORY
  Future<List<HistoryModel>> history() async {
    final url = '${apiService.baseUrl}/history/$_email';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $_token'},
    );

    if (response.statusCode == 200) {
      List result = json.decode(response.body);

      print(result);

      List<HistoryModel> data =
          result.map((e) => HistoryModel.fromJson(e)).toList();
      return data;
    } else {
      return [];
    }
  }

  // NOTE : DELETE HISTORY
  Future deleteHistory(int id) async {
    final url = '${apiService.baseUrl}/history/$id';

    final response = await http.delete(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $_token'},
    );

    final result = json.decode(response.body);

    return DeleteHistoryModel.fromJson(result);
  }

  // NOTE : PREDICT
  Future<PredictResultModel> predict(String image) async {
    final url = '${apiService.baseUrl}/predict';

    print('Ini $_token');

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode({"": image}),
    );

    final result = json.decode(response.body);
    print('Result $result');

    return PredictResultModel.fromJson(result);
  }

  // Future predict(String image) async {
  //   final url = '${apiService.baseUrl}/api/predict?token=$_token';
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({"": image}),
  //     );

  //     _state = ResultState.loading;
  //     notifyListeners();

  //     if (response.statusCode == 200) {
  //       final result = json.decode(response.body);

  //       return PredictResultModel.fromJson(result);
  //     } else {
  //       _state = ResultState.noData;
  //       notifyListeners();

  //       return 'Empty Data';
  //     }
  //   } catch (e) {
  //     _state = ResultState.error;
  //     notifyListeners();
  //     return 'Error $e';
  //   }
  // }

  // NOTE : GET DETAIL
  Future<DetailModel> detailPredict(String nama) async {
    final url = '${apiService.baseUrl}/detail/$nama';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $_token'},
    );

    final result = jsonDecode(response.body);

    return DetailModel.fromJson(result);
  }

  // NOTE : LOGOUT
  Future<void> logout() async {
    _token = null;
    _email = null;
    print('Logout');

    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();

    notifyListeners();
  }

  // NOTE : TANGGAPAN
  Future tanggapan(String tanggapan) async {
    final url = '${apiService.baseUrl}/tanggapan';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {'tanggapan': tanggapan},
        headers: {'Authorization': 'Bearer $_token'},
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);

        return TanggapanModel.fromJson(result);
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}
