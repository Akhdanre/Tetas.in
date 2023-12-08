import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/text_field_custom_all.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
          child: Background(
              screen: screen,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screen.vertical2, horizontal: screen.horizontal2),
                child: Column(
                  children: [
                    const AppBarCustom(title: "Profile"),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("Assets/user_image.png"),
                                  fit: BoxFit.cover),
                              color: Colors.white,
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        "Change Photo",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextFieldCustomAll(
                        title: "Name", textHint: "", controller: name),
                    TextFieldCustomAll(
                        title: "Email", textHint: "", controller: email),
                    TextFieldCustomAll(
                        title: "Incubator Active",
                        textHint: "",
                        controller: email),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: yellowString,
                          minimumSize: const Size.fromHeight(40)),
                      child: const Text(
                        "SAVE",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
