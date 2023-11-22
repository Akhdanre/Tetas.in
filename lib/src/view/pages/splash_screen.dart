import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/view/pages/login_screen.dart';
import 'package:tetas_in/src/view/widgets/background.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
    return Scaffold(
      body: SafeArea(
        child: Background(
          screen: screen,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "Assets/egg.png",
                ),
                SizedBox(
                  height: screen.horizontal2,
                ),
                const Text(
                  "TETAS.IN",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
