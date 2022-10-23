import 'dart:async';

import 'package:ekopy/src/helpers/navigation_helper.dart';
import 'package:ekopy/src/views/screens/home/home_view.dart';
import 'package:ekopy/src/views/screens/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  void init(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      goto(context, const RegisterView(), isReplaced: true);
    });
  }
}
