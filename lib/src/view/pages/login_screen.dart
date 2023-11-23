import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/view/pages/base_screen.dart';
import 'package:tetas_in/src/view/pages/signup_screen.dart';
import 'package:tetas_in/src/view/widgets/background.dart';
import 'package:tetas_in/src/view/widgets/forgot_pass_widget.dart';
import 'package:tetas_in/src/view/widgets/regard_widget.dart';
import 'package:tetas_in/src/view/widgets/text_form_field_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: Background(
        screen: screen,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screen.horizontal2, vertical: screen.vertical1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Regards(screen: screen),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldCustom(hintTxt: "Kukuruyuk"),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "password",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldCustom(hintTxt: "password"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const ForgotPassTextWidget(),
              const Spacer(),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BaseScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: yellowString,
                        minimumSize: const Size.fromHeight(40)),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: blueString),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
