import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/text_field_custom_all.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class StartInkuPage extends StatefulWidget {
  const StartInkuPage({super.key});

  @override
  State<StartInkuPage> createState() => _StartInkuPageState();
}

class _StartInkuPageState extends State<StartInkuPage> {
  TextEditingController idInku = TextEditingController();
  TextEditingController startData = TextEditingController();
  TextEditingController numberofegg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
          child: Background(
              screen: screen,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screen.horizontal2, vertical: screen.vertical2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Tambahkan Jumlah Telur",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldCustomAll(
                        title: "ID Inkubators",
                        textHint: "INK0001",
                        controller: idInku),
                    TextFieldCustomAll(
                        title: "Start Date",
                        textHint: "02/08/2023",
                        controller: idInku),
                    TextFieldCustomAll(
                        title: "Hatch Estimation",
                        textHint: "02/08/2023",
                        controller: idInku),
                    TextFieldCustomAll(
                        title: "Number Of Eggs",
                        textHint: "INK0001",
                        controller: idInku),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                const MaterialStatePropertyAll(yellowString)),
                        child: const Text("Start")),
                  ],
                ),
              ))),
    );
  }
}
