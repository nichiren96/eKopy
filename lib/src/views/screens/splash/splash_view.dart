import 'package:ekopy/src/views/screens/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.init(context),
      builder: (
        BuildContext context,
        SplashViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: Colors.deepPurple,
          body: Center(
            child: Text(
              'E-stage',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
