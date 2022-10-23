import 'package:ekopy/src/helpers/navigation_helper.dart';
import 'package:ekopy/src/services/auth_service.dart';
import 'package:ekopy/src/views/screens/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  AuthService authService = AuthService();
  bool _isObscure = true;
  bool? _isChecked = false;
  bool _isLoading = false;

  bool get isObscure => _isObscure;
  bool? get isChecked => _isChecked;
  bool get isLoading => _isLoading;

  String _name = "";
  String _email = "";
  String _password = "";

  void togglePasswordVisibility() {
    _isObscure = !_isObscure;
    print("TOGGLED");
    notifyListeners();
  }

  void toggleRememberMe(bool? newValue) {
    _isChecked = newValue;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    print(_name);
  }

  void setEmail(String email) {
    _email = email;
    print(_email);
  }

  void setPassword(String password) {
    _password = password;
    print(_password);
  }

  void setIsLoading(bool newState) {
    _isLoading = newState;
    notifyListeners();
  }

  void register(BuildContext context) {
    authService.register(_name, _email, _password).then((value) {
      setIsLoading(false);
      goto(context, HomeView(), isReplaced: true);
    });
  }
}
