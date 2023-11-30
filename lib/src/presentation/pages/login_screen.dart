import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/cubit/auth_cubit.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/pages/base_screen.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/forgot_pass_widget.dart';
import 'package:tetas_in/src/presentation/widgets/regard_widget.dart';
import 'package:tetas_in/src/presentation/widgets/text_form_field_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const BaseScreen(), // Gantilah dengan halaman sign-up yang sesuai
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // Menampilkan floating loading dialog notification
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text("Logging in..."),
                    ],
                  ),
                );
              },
            );
          } else if (state is AuthError) {
            // Menampilkan pesan kesalahan
            Navigator.pop(context); // Tutup loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthSuccess) {
            // Tutup loading dialog
            Navigator.pop(context);
            // Navigasi ke halaman beranda setelah login berhasil
            _navigateToHome();
          }
        },
        child: Background(
          screen: screen,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screen.horizontal2, vertical: screen.vertical1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Regards(screen: screen),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldCustom(controller: username, hintTxt: "Kukuruyuk"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "password",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldCustom(controller: password, hintTxt: "password"),
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
                        context
                            .read<AuthCubit>()
                            .login(username.text, password.text);
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
                          onTap: () {},
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
      ),
    );
  }
}
