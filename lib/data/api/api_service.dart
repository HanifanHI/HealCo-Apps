import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/search_model.dart';
import '../models/disease_model.dart';
import '../models/detail_model.dart';
import '../models/predict_model.dart';

class ApiService {
  // NOTE : BASE URL
  // static const String _baseUrl = 'http://103.174.115.117';
  static const String _baseUrl = 'https://0ae5-182-2-38-189.ngrok.io';

  String get baseUrl => _baseUrl;

  // NOTE : PREDICT
  Future<PredictModel> predict(String image) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/predict'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"": image}),
      );

      if (response.statusCode == 200) {
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
  Future<DetailModel> detail(String nama) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/detail/$nama'));

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

  // NOTE : DISEASE LIST
  Future<DiseaseModel> disease() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/disease'));

      if (response.statusCode == 200) {
        return DiseaseModel.fromJson(json.decode(response.body));
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

  // NOTE : SEARCH DISEASE
  Future<SearchModel> search(String query) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/disease/search/$query'));

      if (response.statusCode == 200) {
        return SearchModel.fromJson(json.decode(response.body));
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
}
