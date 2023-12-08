import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/pages/login_screen.dart';
import 'package:tetas_in/src/presentation/pages/start_inku_screen.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/button_menu.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
          child: Background(
              screen: screen,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screen.vertical2,
                      horizontal: screen.horizontal2),
                  child: Column(children: [
                    const AppBarCustom(title: "Setting"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screen.horizontal3, vertical: 30),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("Assets/user_image.png"),
                                    fit: BoxFit.cover),
                                color: Colors.white,
                                shape: BoxShape.circle),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Akeon",
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 96, 255, 101),
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("ID Inkubator : INK0001")
                                  ])
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: const Icon(Icons.arrow_forward_ios_outlined),
                          )
                        ],
                      ),
                    ),
                    const ButtonMenu(
                      icon: Icons.edit,
                      text: "Add Inkubator",
                      target: StartInkuPage(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ButtonMenu(
                      icon: Icons.list_rounded,
                      text: "List Inkubator",
                      target: StartInkuPage(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ButtonMenu(
                      icon: Icons.language,
                      text: "Language",
                      target: StartInkuPage(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ButtonMenu(
                      icon: Icons.edit,
                      text: "About Tetasin",
                      target: StartInkuPage(),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: yellowString,
                          minimumSize: const Size.fromHeight(40)),
                      child: const Text(
                        "LOGOUT",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ])))),
    );
  }
}
