import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/cubit/register_cubit.dart';
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
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  TextEditingController inkubatorId = TextEditingController();
  TextEditingController token = TextEditingController();
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
                  TextFieldCustomAll(
                    controller: username,
                    title: "Username",
                    textHint: "kukuruyuk",
                  ),
                  TextFieldCustomAll(
                    controller: name,
                    title: "Name",
                    textHint: "ayam",
                  ),
                  TextFieldCustomAll(
                    controller: password,
                    title: "Password",
                    textHint: "",
                  ),
                  TextFieldCustomAll(
                    controller: passwordconfirm,
                    title: "Confirm Password",
                    textHint: "",
                  ),
                  TextFieldCustomAll(
                    controller: inkubatorId,
                    title: "ID Inkubator",
                    textHint: "IND0001",
                  ),
                  TextFieldCustomAll(
                    controller: token,
                    title: "Token",
                    textHint: "kwdtghtk",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<RegisterCubit>()
                          .register(username.text, password.text, name.text);
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
                ],
              ),
            )),
      ),
    );
  }
}
