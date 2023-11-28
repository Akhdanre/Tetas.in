import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/cubit/login_cubit.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/pages/login_screen.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  void goToLoginPage(context) => Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => LoginCubit(),
                    child: const LoginScreen(),
                  )),
        );
      });

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    goToLoginPage(context);
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
