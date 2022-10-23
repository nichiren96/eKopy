import 'package:ekopy/src/views/screens/splash/splash_view.dart';
import 'package:flutter/material.dart';

class Ekopy extends StatelessWidget {
  const Ekopy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ekopy',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: "DM Sans",
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
