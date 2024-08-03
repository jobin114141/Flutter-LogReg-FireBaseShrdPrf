import 'package:flutter/material.dart';

class ShrdPrfns with ChangeNotifier {
  bool logedOrNot = false;


  void chnageValue(bool a) {
    logedOrNot = a;
    notifyListeners();
  }
}
