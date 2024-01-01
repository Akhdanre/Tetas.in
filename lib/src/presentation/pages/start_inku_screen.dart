import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/text_field_custom_all.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

import '../../utils/shared_preferences/user_data.dart';

class StartInkuPage extends StatefulWidget {
  const StartInkuPage({super.key});

  @override
  State<StartInkuPage> createState() => _StartInkuPageState();
}

class _StartInkuPageState extends State<StartInkuPage> {
  TextEditingController idInku = TextEditingController();
  TextEditingController startData = TextEditingController();
  TextEditingController numberOfEgg = TextEditingController();
  late List<String> listInku;
  String selectedValue = "INK0001";

  @override
  void initState() {
    super.initState();
    dataInku();
  }

  Future<void> dataInku() async {
    listInku = await UserData().inkubator;
  }

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
                    const AppBarCustom(title: "Tambahkan Jumlah Telur"),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder(
                      builder: (context, state) {
                        if (1 == 1) {
                          return DropdownButton<String>(
                            value: selectedValue,
                            underline: const SizedBox(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            items: listInku
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (newValue) {
                              // context.read<HomeBloc>().add(
                              //     DataInkubatorSwitch(id: newValue!));
                            },
                          );
                        }
                        return TextFieldCustomAll(
                            title: "Start Date",
                            textHint: "02/08/2023",
                            controller: startData);
                      },
                    ),
                    TextFieldCustomAll(
                        title: "Start Date",
                        textHint: "02/08/2023",
                        controller: startData),
                    TextFieldCustomAll(
                        title: "Hatch Estimation",
                        textHint: "23/08/2023",
                        controller: idInku),
                    TextFieldCustomAll(
                        title: "Number Of Eggs",
                        textHint: "12",
                        controller: numberOfEgg),
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
