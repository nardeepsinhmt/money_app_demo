import 'package:flutter/material.dart';

class SwitchToggleProvider extends ChangeNotifier {
  bool _isSwitch = false;

  bool get isSwitch => _isSwitch;

  void setSwitchValue(bool value) {
    if (value != _isSwitch) {
      _isSwitch = value;
      notifyListeners();
    }
  }
}
