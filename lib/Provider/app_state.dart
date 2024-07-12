import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  String _currentPage = '/main';

  String get currentPage => _currentPage;

  void setCurrentPage(String page) {
    _currentPage = page;
    notifyListeners();
  }
}