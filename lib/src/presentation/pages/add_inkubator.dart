import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/text_field_custom_all.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class AddInkubatorPage extends StatefulWidget {
  const AddInkubatorPage({super.key});

  @override
  State<AddInkubatorPage> createState() => _AddInkubatorPageState();
}

class _AddInkubatorPageState extends State<AddInkubatorPage> {
  final TextEditingController idInkubator = TextEditingController();
  final TextEditingController token = TextEditingController();

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
                    const AppBarCustom(title: "Add Inkubator"),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldCustomAll(
                        title: "ID Inkubator",
                        textHint: "INK0001",
                        controller: idInkubator),
                    TextFieldCustomAll(
                        title: "Token",
                        textHint: "kwgtkndhe",
                        controller: token),
                    const SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor:
                                const MaterialStatePropertyAll(yellowString)),
                        child: const Text("ADD")),
                  ],
                ),
              ))),
    );
  }
}
