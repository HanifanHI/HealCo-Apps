import 'dart:convert';
import 'dart:io';
import 'package:healco/data/models/edit_profile_model.dart';
import 'package:healco/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../models/delete_history_model.dart';
import '../models/detail_model.dart';
import '../models/history_model.dart';
import '../models/login_model.dart';
import '../models/predict_result_model.dart';
import '../models/register_model.dart';
import '../models/tanggapan_model.dart';

class ApiService {
  static const String _baseUrl = 'https://healco.hanifanhi.com';

  // NOTE : REGISTER
  Future<RegisterModel> register(
      String name, String email, String noHp, String password) async {
    try {
      final response = await http.post(Uri.parse('$_baseUrl/register'), body: {
        "name": name,
        "email": email,
        "no_hp": noHp,
        "password": password
      });

      if (response.statusCode == 200) {
        return RegisterModel.fromJson(json.decode(response.body));
      } else {
        throw 'Failed to load data';
      }
    } on SocketException {
      throw 'No internet connection';
    } on HttpException {
      throw 'Couldn\'t find the post';
    } on FormatException {
      throw 'Bad response format';
    } catch (e) {
      throw '$e';
    }
  }

  // NOTE : LOGIN
  Future<LoginModel> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse('$_baseUrl/login'), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        return LoginModel.fromJson(json.decode(response.body));
      } else {
        throw 'Failed to load data';
      }
    } on SocketException {
      throw 'No internet connection';
    } on HttpException {
      throw 'Couldn\'t find the post';
    } on FormatException {
      throw 'Bad response format';
    } catch (e) {
      throw '$e';
    }
  }

  // NOTE : PREDICT
  Future<PredictResultModel> predict(String image, String token) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/predict'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({"": image}),
      );

      if (response.statusCode == 200) {
        return PredictResultModel.fromJson(json.decode(response.body));
      } else {
        throw 'Failed to load data';
      }
    } on SocketException {
      throw 'No internet connection';
    } on HttpException {
      throw 'Couldn\'t find the post';
    } on FormatException {
      throw 'Bad response format';
    } catch (e) {
      throw '$e';
    }
  }

  // NOTE : DETAIL
  Future<DetailModel> detail(String nama, String token) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/detail/$nama'), headers: {
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        return DetailModel.fromJson(json.decode(response.body));
      } else {
        throw 'Failed to load data';
      }
    } on SocketException {
      throw 'No internet connection';
    } on HttpException {
      throw 'Couldn\'t find the post';
    } on FormatException {
      throw 'Bad response format';
    } catch (e) {
      throw '$e';
    }
  }

  // NOTE : HISTORY
  Future<HistoryModel> history(String email, String token) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/history/$email'), headers: {
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        return HistoryModel.fromJson(json.decode(response.body));
      } else {
        throw 'Failed to load data';
      }
    } on SocketException {
      throw 'No internet connection';
    } on HttpException {
      throw 'Couldn\'t find the post';
    } on FormatException {
      throw 'Bad response format';
    } catch (e) {
      throw '$e';
    }
  }

  // NOTE : HISTORY
  Future<DeleteHistoryModel> deleteHistory(int id, String token) async {
    try {
      final response = await http.delete(
        Uri.parse('$_baseUrl/history/$id'),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        return DeleteHistoryModel.fromJson(json.decode(response.body));
      } else {
        throw 'Failed to load data';
      }
    } on SocketException {
      throw 'No internet connection';
    } on HttpException {
      throw 'Couldn\'t find the post';
    } on FormatException {
      throw 'Bad response format';
    } catch (e) {
      throw '$e';
    }
  }

  // NOTE : LOGIN
  Future<TanggapanModel> tanggapan(String tanggapan, String token) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/tanggapan'),
        headers: {"Authorization": "Bearer $token"},
        body: {"tanggapan": tanggapan},
      );

      if (response.statusCode == 200) {
        return TanggapanModel.fromJson(json.decode(response.body));
      } else {
        throw 'Failed to load data';
      }
    } on SocketException {
      throw 'No internet connection';
    } on HttpException {
      throw 'Couldn\'t find the post';
    } on FormatException {
      throw 'Bad response format';
    } catch (e) {
      throw '$e';
    }
  }

  // NOTE : USER
  Future<UserModel> user(String email, String token) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/editprofile/$email'), headers: {
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        return UserModel.fromJson(json.decode(response.body));
      } else {
        throw 'Failed to load data';
      }
    } on SocketException {
      throw 'No internet connection';
    } on HttpException {
      throw 'Couldn\'t find the post';
    } on FormatException {
      throw 'Bad response format';
    } catch (e) {
      throw '$e';
    }
  }
}

  // String? token;

  // Future<PredictResultModel> predict(String image, String token) async {
  //   print(token);
  //   String url = '$baseUrl/api/predict?token=$token';

  //   var response = await http.post(Uri.parse(url),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({"": image}));

  //   var data = jsonDecode(response.body);

  //   return PredictResultModel(
  //     probability: data['probability'],
  //     result: data['result'],
  //   );
  // }

  // static Future<DetailModel> getDetail(String nama) async {
  //   String url = '$baseUrl/api/detail/$nama';

  //   var response = await http.get(Uri.parse(url));

  //   var data = jsonDecode(response.body);

  //   return DetailModel(
  //     nama: data['nama'],
  //     deskripsi: data['deskripsi'],
  //     gejala: data['gejala'],
  //     pengobatan: data['pengobatan'],
  //     gambar: data['gambar'],
  //   );
  // }

  // static Future<List<HistoryModel>> getHistory() async {
  //   String url = '$baseUrl/api/history';

  //   var response = await http.get(Uri.parse(url));

  //   var data = jsonDecode(response.body) as List;
  //   print(data);

  //   List<HistoryModel> hasil =
  //       data.map((e) => HistoryModel.fromJson(e)).toList();

  //   return hasil;
  // }

  // static deleteHistory(int id) async {
  //   String url = '$baseUrl/api/history/$id';

  //   var response = await http.delete(Uri.parse(url));
  // }

  // // ============ REGISTER
  // static register(
  //     String nama, String email, String noHp, String password) async {
  //   String url = '$baseUrl/api/register';

  //   var response = await http.post(Uri.parse(url), body: {
  //     'username': nama,
  //     'email': email,
  //     'no_hp': noHp,
  //     'password': password
  //   });
  // }

  // Future<LoginModel> login(String email, String password) async {
  //   String url = '$baseUrl/api/login';

  //   var response = await http
  //       .post(Uri.parse(url), body: {'email': email, 'password': password});

  //   if (response.statusCode == 200) {
  //     var hasil = jsonDecode(response.body);
  //     print(hasil);

  //     token = hasil['token'];
  //     print(token);

  //     // final sharedPref = await SharedPreferences.getInstance();
  //     // if (sharedPref.containsKey('token')) {
  //     //   sharedPref.clear();
  //     // }

  //     // sharedPref.setString('token', token!);

  //     // final myPref = json.encode({'token': token});

  //     // sharedPref.setString('myToken', myPref);

  //     // this.email = hasil['email'] ?? '';
  //     return LoginModel.fromJson(hasil);
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }

  // // Future<bool> autoLogin() async {
  // //   final pref = await SharedPreferences.getInstance();

  // //   if (pref.containsKey('myToken')) {
  // //     final myToken = json.decode(pref.getString('myToken') as String)
  // //         as Map<String, dynamic>;
  // //     token = myToken['token'];
  // //     return true;
  // //   } else {
  // //     token = null;
  // //     return false;
  // //   }
  // // }

