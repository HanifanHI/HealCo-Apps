import 'package:flutter/material.dart';

import '../interface/page_interface.dart';

class PageProvider extends ChangeNotifier implements PageInterface {
  late int _page = 0;

  // NOTE : GET & SET PAGE
  int get page => _page;

  @override
  void setPage(int newPage) {
    _page = newPage;
    notifyListeners();
  }
}
