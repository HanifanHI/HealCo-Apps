import 'package:flutter/material.dart';
import '../data/models/history_model.dart';
import '../helpers/db_helper.dart';
import '../interface/db_interface.dart';

class DatabaseProvider extends ChangeNotifier implements DbInterface {
  List<HistoryModel> _histories = [];
  late DatabaseHelper _databaseHelper;

  List<HistoryModel> get histories => _histories;

  DatabaseProvider() {
    // NOTE : Membuat objek kelas DatabaseHelper
    _databaseHelper = DatabaseHelper();
    // NOTE : Panggil method _getAllHistory()
    getAllHistory();
  }

  @override
  void getAllHistory() async {
    _histories = await _databaseHelper.getHistory();
    notifyListeners();
  }

  // NOTE : Menambah data kedalam database
  @override
  Future<void> addHistory(HistoryModel historyModel) async {
    await _databaseHelper.insertHistory(historyModel);
    getAllHistory();
  }

  // NOTE : Hapus data
  @override
  void deleteHistory(int id) async {
    await _databaseHelper.deleteHistory(id);
    getAllHistory();
  }
}
