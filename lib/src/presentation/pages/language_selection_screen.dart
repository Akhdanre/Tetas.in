import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  TextEditingController textEdit = TextEditingController();
  String selectedLanguage = 'English';
  List<String> languages = ['English', 'Indonesia'];

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
              horizontal: screen.horizontal2,
            ),
            child: Column(
              children: [
                const AppBarCustom(title: "Language"),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Change Language",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // Garis tepi
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton(
                            isExpanded: true,
                            underline: const SizedBox(),
                            focusColor: baseWhite,
                            value: selectedLanguage,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLanguage = newValue!;
                              });
                            },
                            items: languages.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            const MaterialStatePropertyAll(yellowString)),
                    child: const Text("SAVE")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
