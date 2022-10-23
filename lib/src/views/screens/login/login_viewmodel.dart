import 'package:ekopy/src/helpers/navigation_helper.dart';
import 'package:ekopy/src/services/auth_service.dart';
import 'package:ekopy/src/views/screens/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  AuthService authService = AuthService();
  bool _isObscure = true;
  bool? _isChecked = false;
  bool _isLoading = false;

  String _email = "";
  String _password = "";

  bool get isObscure => _isObscure;
  bool? get isChecked => _isChecked;
  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void toggleRememberMe(bool? newValue) {
    _isChecked = newValue;
    notifyListeners();
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

  void login(BuildContext context) {
    authService.login(_email, _password).then(
      (value) {
        setIsLoading(false);
        goto(context, const HomeView(), isReplaced: true);
      },
    );
  }
}
