import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/regard_widget.dart';
import 'package:tetas_in/src/presentation/widgets/text_field_custom_all.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
        child: Background(
            screen: screen,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screen.horizontal2, vertical: screen.vertical1),
              child: ListView(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Regards(screen: screen)),
                  const TextFieldCustomAll(
                    title: "Username",
                    textHint: "kukuruyuk",
                  ),
                  const TextFieldCustomAll(
                    title: "Name",
                    textHint: "ayam",
                  ),
                  const TextFieldCustomAll(
                    title: "Password",
                    textHint: "",
                  ),
                  const TextFieldCustomAll(
                    title: "Confirm Password",
                    textHint: "",
                  ),
                  const TextFieldCustomAll(
                    title: "ID Inkubator",
                    textHint: "IND0001",
                  ),
                  const TextFieldCustomAll(
                    title: "Token",
                    textHint: "kwdtghtk",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: yellowString,
                        minimumSize: const Size.fromHeight(40)),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
