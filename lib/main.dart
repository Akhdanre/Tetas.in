import 'package:flutter/material.dart';
import 'package:tetas_in/src/view/pages/splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tetas.In",
      theme:
          ThemeData(primaryColor: Colors.white, brightness: Brightness.light),
      home: const SplashScreenPage(),
    );
  }
}
