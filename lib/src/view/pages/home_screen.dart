import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/view/widgets/background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user = "Akeon";
  String idIncubator = "IND00001";

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
                            color: Colors.white, shape: BoxShape.circle),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                            color: yellowString,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                            color: yellowString,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                            color: yellowString,
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: screen.vertical2,
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Evolution',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Controller',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_outlined),
              label: 'History',
            ),
          ]),
    );
  }
}
