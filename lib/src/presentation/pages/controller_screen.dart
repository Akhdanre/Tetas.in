import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/controller_bloc.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  double tempLimit = 30.0;
  double humdLimit = 40.0;
  String description1 = "";
  String description2 = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
          child: BlocListener<ControllerBloc, ControllerState>(
        listener: (context, state) {
          if (state is ShowScaffold) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Yay! A SnackBar!'),
            ));
          }
        },
        child: Background(
            screen: screen,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "Controller",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: baseColorBg,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(2, 5),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Temperature",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: yellowString,
                                    inactiveTrackColor: grayTransparentString,
                                    thumbColor: Colors.black,
                                    trackHeight: 20,
                                    thumbShape: const RoundSliderThumbShape(
                                        pressedElevation: 0,
                                        elevation: 0,
                                        enabledThumbRadius: 10.0)),
                                child: BlocBuilder<ControllerBloc,
                                    ControllerState>(
                                  builder: (context, state) {
                                    if (state is ControllerInitial) {
                                      tempLimit =
                                          state.tempDefaultValue.toDouble();
                                    }
                                    if (state is ControllerTempUpdate) {
                                      tempLimit =
                                          state.tempSliderValue.toDouble();
                                    }
                                    return Slider(
                                      value: tempLimit,
                                      max: 40,
                                      min: 35,
                                      onChanged: (value) {
                                        context.read<ControllerBloc>().add(
                                            UpdateTempLimit(
                                                temp: value.toInt()));
                                      },
                                    );
                                  },
                                ))
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: baseColorBg,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(2, 5),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Humidity",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: yellowString,
                                    inactiveTrackColor: grayTransparentString,
                                    thumbColor: Colors.black,
                                    trackHeight: 20,
                                    thumbShape: const RoundSliderThumbShape(
                                        pressedElevation: 0,
                                        elevation: 0,
                                        enabledThumbRadius: 10.0)),
                                child: BlocBuilder<ControllerBloc,
                                    ControllerState>(builder: (context, state) {
                                  if (state is ControllerInitial) {
                                    humdLimit =
                                        state.humdDefaultValue.toDouble();
                                  }
                                  if (state is ControllerHumdUpdate) {
                                    humdLimit =
                                        state.humdSliderValue.toDouble();
                                  }
                                  return Slider(
                                    value: humdLimit,
                                    max: 60,
                                    min: 55,
                                    onChanged: (value) {
                                      context.read<ControllerBloc>().add(
                                          UpdateHumdLimit(humd: value.toInt()));
                                    },
                                  );
                                })),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: baseColorBg,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(2, 5),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Information",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Suhu",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          BlocBuilder<ControllerBloc, ControllerState>(
                            builder: (context, state) {
                              if (state is ControllerInitial) {
                                description1 =
                                    AppLocalizations.of(context).temp_in_38;
                              }

                              if (state is ControllerTempUpdate) {
                                int condition = state.tempSliderValue;

                                switch (condition) {
                                  case 35:
                                    description1 =
                                        AppLocalizations.of(context).temp_in_35;
                                    break;
                                  case 36:
                                    description1 =
                                        AppLocalizations.of(context).temp_in_36;
                                    break;
                                  case 37:
                                    description1 =
                                        AppLocalizations.of(context).temp_in_37;
                                    break;
                                  case 38:
                                    description1 =
                                        AppLocalizations.of(context).temp_in_38;
                                    break;
                                  case 39:
                                    description1 =
                                        AppLocalizations.of(context).temp_in_39;
                                    break;
                                  case 40:
                                    description1 =
                                        AppLocalizations.of(context).temp_in_40;
                                    break;
                                }
                              }

                              return Text(
                                description1,
                                textAlign: TextAlign.justify,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Kelembapan",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          BlocBuilder<ControllerBloc, ControllerState>(
                            builder: (context, state) {
                              if (state is ControllerInitial) {
                                description2 =
                                    AppLocalizations.of(context).humd_in_58;
                              }

                              if (state is ControllerHumdUpdate) {
                                int condition = state.humdSliderValue;
                                switch (condition) {
                                  case 55:
                                    description2 =
                                        AppLocalizations.of(context).humd_in_55;
                                    break;
                                  case 56:
                                    description2 =
                                        AppLocalizations.of(context).humd_in_56;
                                    break;
                                  case 57:
                                    description2 =
                                        AppLocalizations.of(context).humd_in_57;
                                    break;
                                  case 58:
                                    description2 =
                                        AppLocalizations.of(context).humd_in_58;
                                    break;
                                  case 59:
                                    description2 =
                                        AppLocalizations.of(context).humd_in_59;
                                    break;
                                  case 60:
                                    description2 =
                                        AppLocalizations.of(context).humd_in_60;
                                    break;
                                }
                              }

                              return Text(
                                description2,
                                textAlign: TextAlign.justify,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
