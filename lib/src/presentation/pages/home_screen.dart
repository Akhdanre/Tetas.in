import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/home_bloc.dart';
import 'package:tetas_in/src/presentation/pages/setting_screen.dart';
import 'package:tetas_in/src/presentation/pages/start_inku_screen.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/shared_preferences/user_data.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/status_info_inku_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  String user = "akhdanre";
  String idIncubator = "IND00004";
  String dueDate = "12-12-2023";
  String selectedValue = "INK0001";
  late List<String> listInku;

  @override
  void initState() {
    dataListInku();
    super.initState();
  }

  void dataListInku() async {
    listInku = await UserData().inkubator;
    // if(list)
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SizeConfig screen = SizeConfig(context);
    log("reload has active");
    return Scaffold(
      body: SafeArea(
        child: Background(
          screen: screen,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screen.horizontal4, vertical: screen.vertical2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, $user",
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 96, 255, 101),
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("ID Inkubator"),
                              const SizedBox(
                                width: 3,
                              ),
                              BlocBuilder<HomeBloc, HomeState>(
                                buildWhen: (previous, current) =>
                                    previous != current &&
                                        current is UpdateInkubatorList ||
                                    current is UpdateInkubatorSwitch,
                                builder: (context, state) {
                                  if (state is UpdateInkubatorList) {
                                    selectedValue = state.id[0];
                                    return DropdownButton<String>(
                                      value: selectedValue,
                                      underline: const SizedBox(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      items: state.id
                                          .map((e) => DropdownMenuItem(
                                              value: e, child: Text(e)))
                                          .toList(),
                                      onChanged: (newValue) {
                                        context.read<HomeBloc>().add(
                                            DataInkubatorSwitch(id: newValue!));
                                      },
                                    );
                                  }
                                  if (state is UpdateInkubatorSwitch) {
                                    UserData()
                                        .inkubator
                                        .then((value) => listInku = value);
                                    selectedValue = state.id;
                                    return DropdownButton<String>(
                                      value: selectedValue,
                                      underline: const SizedBox(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      items: listInku
                                          .map((e) => DropdownMenuItem(
                                              value: e, child: Text(e)))
                                          .toList(),
                                      onChanged: (newValue) {
                                        context.read<HomeBloc>().add(
                                            DataInkubatorSwitch(id: newValue!));
                                      },
                                    );
                                  }
                                  return const Text("loading");
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingScreen(),
                            )),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("Assets/user_image.png"),
                                  fit: BoxFit.cover),
                              color: Colors.white,
                              shape: BoxShape.circle),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Container(
                      // height: 350,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(1.5, 5),
                            )
                          ],
                          // color: baseColorBg,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (previous, current) =>
                            previous != current && current is UpdateDayProgress,
                        builder: (context, state) {
                          if (state is UpdateDayProgress) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      child: Image.asset(
                                          "Assets/Telur/${state.day}.jpg")),
                                  Text("Day ${state.day}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "Due date : $dueDate",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            );
                          }
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const StartInkuPage(),
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                      child: Image.asset("Assets/Telur/1.jpg")),
                                  const Text("START",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (previous, current) =>
                            previous != current && current is HomeUpdate,
                        builder: (context, state) {
                          if (state is HomeUpdate) {
                            return StatusInfoInku(
                              value: state.temp,
                              title: 'Temperature',
                            );
                          }
                          return const StatusInfoInku(
                            value: 0,
                            title: 'Temperature',
                          );
                        },
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (previous, current) =>
                            previous != current && current is HomeUpdate,
                        builder: (context, state) {
                          if (state is HomeUpdate) {
                            return StatusInfoInku(
                              value: state.humd,
                              title: 'Humidity',
                            );
                          }
                          return const StatusInfoInku(
                            value: 0,
                            title: 'Humidity',
                          );
                        },
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (previous, current) =>
                            previous != current && current is HomeUpdate,
                        builder: (context, state) {
                          if (state is HomeUpdate) {
                            return StatusInfoInku(
                              value: state.waterVolume,
                              title: 'Water Volume',
                            );
                          }
                          return const StatusInfoInku(
                            value: 0,
                            title: 'water',
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screen.vertical2,
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
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Text(
                            "Progress to hatch",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: yellowString,
                                  trackHeight: 20,
                                  thumbColor: Colors.transparent,
                                  thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 0.0)),
                              child: BlocBuilder<HomeBloc, HomeState>(
                                buildWhen: (previous, current) =>
                                    previous != current &&
                                    current is UpdateDayProgress,
                                builder: (context, state) {
                                  if (state is UpdateDayProgress) {
                                    return Stack(
                                      children: [
                                        Slider(
                                            max: 21,
                                            value: state.day.toDouble(),
                                            inactiveColor:
                                                grayTransparentString,
                                            onChanged: (value) {}),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 40),
                                          child: Text(
                                            "${state.day}%",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Stack(
                                    children: [
                                      Slider(
                                          max: 21,
                                          value: 1,
                                          inactiveColor: grayTransparentString,
                                          onChanged: (value) {}),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 40),
                                        child: Text(
                                          "12%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Container(
                    height: 200,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
