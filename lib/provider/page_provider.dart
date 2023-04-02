import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  late int _page = 0;

  // NOTE : GET & SET PAGE
  int get page => _page;

  void setPage(int newPage) {
    _page = newPage;
    notifyListeners();
  }
}
