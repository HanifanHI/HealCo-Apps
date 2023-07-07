import '../data/models/history_model.dart';

abstract class DbInterface {
  void getAllHistory();
  Future<void> addHistory(HistoryModel historyModel);
  void deleteHistory(int id);
}
