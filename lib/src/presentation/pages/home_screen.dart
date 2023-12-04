import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/home_bloc.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/presentation/widgets/status_info_inku_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user = "Akeon";
  String idIncubator = "IND00001";
  int day = 15;
  String dueDate = "12-12-2023";
  int temp = 38;
  int humd = 38;
  int water = 38;

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
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
                              Text("ID Inkubator $idIncubator")
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/user_image.png"),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            shape: BoxShape.circle),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(1.5, 5),
                          )
                        ],
                        color: baseColorBg,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(child: Image.asset("Assets/egg_image_15.png")),
                          Text("Day $day",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Text(
                            "Due date : $dueDate",
                            style: const TextStyle(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is HomeUpdate) {
                            return StatusInfoInku(
                              value: state.temp,
                              title: 'Temperature',
                            );
                          }
                          return StatusInfoInku(
                            value: (state as HomeInitial)
                                .defaultValue, // Assuming temp is the temperature property in HomeInitial
                            title: 'Temperature',
                          );
                        },
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is HomeUpdate) {
                            return StatusInfoInku(
                              value: state.humd,
                              title: 'Humidity',
                            );
                          }
                          return StatusInfoInku(
                            value: (state as HomeInitial)
                                .defaultValue, // Assuming temp is the temperature property in HomeInitial
                            title: 'Humidity',
                          );
                        },
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is HomeUpdate) {
                            return StatusInfoInku(
                              value: state.waterVolume,
                              title: 'Water Volume',
                            );
                          }
                          return StatusInfoInku(
                            value: (state as HomeInitial)
                                .defaultValue, // Assuming temp is the temperature property in HomeInitial
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
                              child: Stack(
                                children: [
                                  Slider(
                                      max: 100,
                                      value: 20,
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
}
