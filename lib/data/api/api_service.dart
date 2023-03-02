import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../models/delete_history_model.dart';
import '../models/detail_model.dart';
import '../models/history_model.dart';
import '../models/login_model.dart';
import '../models/predict_model.dart';
import '../models/register_model.dart';
import '../models/tanggapan_model.dart';

class ApiService {
  static const String _baseUrl = 'https://hanifanhi.com';

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
        throw 'Gagal memuat data';
      }
    } on SocketException {
      throw 'Tidak ada koneksi internet';
    } on HttpException {
      throw 'Tidak dapat melakukan request';
    } on FormatException {
      throw 'Format response buruk';
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
        throw 'Gagal memuat data';
      }
    } on SocketException {
      throw 'Tidak ada koneksi internet';
    } on HttpException {
      throw 'Tidak dapat melakukan request';
    } on FormatException {
      throw 'Format response buruk';
    } catch (e) {
      throw '$e';
    }
  }

  // NOTE : PREDICT
  Future<PredictModel> predict(String image, String token) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/predict'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({"": image}),
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        print('Ini dieksekusi');
        print(response.body);
        return PredictModel.fromJson(json.decode(response.body));
      } else {
        throw 'Gagal memuat data';
      }
    } on SocketException {
      throw 'Tidak ada koneksi internet';
    } on HttpException {
      throw 'Tidak dapat melakukan request';
    } on FormatException {
      throw 'Format response buruk';
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

      print('Detail ${response.statusCode}');
      print(response.body);

      if (response.statusCode == 200) {
        return DetailModel.fromJson(json.decode(response.body));
      } else {
        throw 'Gagal memuat data';
      }
    } on SocketException {
      throw 'Tidak ada koneksi internet';
    } on HttpException {
      throw 'Tidak dapat melakukan request';
    } on FormatException {
      throw 'Format response buruk';
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
        throw 'Gagal memuat data';
      }
    } on SocketException {
      throw 'Tidak ada koneksi internet';
    } on HttpException {
      throw 'Tidak dapat melakukan request';
    } on FormatException {
      throw 'Format response buruk';
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
        throw 'Gagal menghapus data';
      }
    } on SocketException {
      throw 'Tidak ada koneksi internet';
    } on HttpException {
      throw 'Tidak dapat melakukan request';
    } on FormatException {
      throw 'Format response buruk';
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
