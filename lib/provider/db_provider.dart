import 'package:flutter/material.dart';
import '../data/models/history_model.dart';
import '../helpers/db_helper.dart';

class DatabaseProvider extends ChangeNotifier {
  List<HistoryModel> _histories = [];
  late DatabaseHelper _databaseHelper;

  List<HistoryModel> get histories => _histories;

  DatabaseProvider() {
    // NOTE : Membuat objek kelas DatabaseHelper
    _databaseHelper = DatabaseHelper();
    // NOTE : Panggil method _getAllHistory()
    _getAllHistory();
  }

  void _getAllHistory() async {
    _histories = await _databaseHelper.getHistory();
    notifyListeners();
  }

  // NOTE : Menambah data kedalam database
  Future<void> addHistory(HistoryModel historyModel) async {
    await _databaseHelper.insertHistory(historyModel);
    _getAllHistory();
  }

  // NOTE : Hapus data
  void deleteHistory(int id) async {
    await _databaseHelper.deleteHistory(id);
    _getAllHistory();
  }
}
