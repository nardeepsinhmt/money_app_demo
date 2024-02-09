import 'package:flutter/material.dart';

class PayAmountProvider extends ChangeNotifier {
  String _amount = "";

  String get amount => _amount;

  void setAmount(String value) {
    if (value != _amount) {
      _amount = value.isEmpty ? "0.0" : value;
      notifyListeners();
    }
  }
}
