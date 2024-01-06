import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/cubit/start_inku_cubit.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/text_field_custom_all.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class StartInkuPage extends StatelessWidget {
  StartInkuPage({super.key});

  final TextEditingController idInku = TextEditingController();
  final TextEditingController startData = TextEditingController();
  final TextEditingController numberOfEgg = TextEditingController();

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
                    BlocBuilder<StartInkuCubit, StartInkuState>(
                      buildWhen: (previous, current) =>
                          previous != current && current is UpdateIdInku,
                      builder: (context, state) {
                        if (state is UpdateIdInku) {
                          return DropdownButton<String>(
                            value: "super",
                            underline: const SizedBox(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            items: state.listInkubators
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (newValue) {
                              // context.read<StartInkuCubit>().add(
                              //     Startinku);
                            },
                          );
                        }
                        return TextFieldCustomAll(
                            title: "ID Inkubator",
                            textHint: "INK0001",
                            controller: idInku);
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
