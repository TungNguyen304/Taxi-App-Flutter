import 'dart:async';

import 'package:first_demo/src/validators/validation.dart';

class LoginBloc {
  final StreamController _userController = StreamController();
  final StreamController _passController = StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String password) {
    if (Validation.isValidUser(username) && Validation.isValidPass(password)) {
      return true;
    }
    if (!Validation.isValidUser(username)) {
      _userController.sink.addError("Username không hợp lệ");
    } else {
      _userController.sink.add(true);
    }
    if (!Validation.isValidPass(password)) {
      _passController.sink.addError("Password không hợp lệ");
    } else {
      _passController.sink.add(true);
    }
    return false;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}