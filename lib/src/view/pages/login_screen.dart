import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/view/widgets/background.dart';
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
              SizedBox(
                height: screen.vertical2,
              ),
              const Text("HI!\nWELCOME",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900)),
              const Text(
                "Please enter your account",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: screen.vertical3,
              ),
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
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: blueString,
                  ),
                ),
              ),
              const Spacer(),
              // Align(
              //   alignment: Alignment.bottomCenter,
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: yellowString,
                        minimumSize: const Size.fromHeight(40)),
                    child: const Text("LOGIN"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      Text(
                        "Sign Up",
                        style: TextStyle(color: blueString),
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
