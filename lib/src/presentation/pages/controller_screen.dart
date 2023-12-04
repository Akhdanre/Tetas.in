import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  double tempLimit = 30.0;
  double humdLimit = 40.0;
  String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis non mauris id sodales. Maecenas id tincidunt ligula. Fusce leo dui, accumsan at leo sit amet, lobortis interdum felis.v";

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
          child: Background(
              screen: screen,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Controller",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                                  child: Slider(
                                      value: tempLimit,
                                      max: 50,
                                      min: 25,
                                      onChanged: (value) {
                                        setState(() {
                                          tempLimit = value;
                                        });
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
                                  child: Slider(
                                      value: humdLimit,
                                      max: 100,
                                      min: 0,
                                      onChanged: (value) {
                                        setState(() {
                                          humdLimit = value;
                                        });
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
                            Text(
                              description,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
