import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class ListInkubatorsPage extends StatefulWidget {
  const ListInkubatorsPage({Key? key}) : super(key: key);

  @override
  State<ListInkubatorsPage> createState() => _ListInkubatorsPageState();
}

class _ListInkubatorsPageState extends State<ListInkubatorsPage> {
  // Assuming these values are declared somewhere

  // Generate some dummy data for the list
  List<String> inkubatorData = List.generate(
      50, (index) => index > 8 ? "INK00${index + 1}" : "INK000${index + 1}");

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
                const AppBarCustom(title: "List Inkubator"),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: baseWhite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ID Inkubator"),
                              Text("Token"),
                              Text("Action"),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 2,
                        ),
                        Expanded(
                          // Wrap the ListView.builder in Expanded
                          child: ListView.builder(
                            itemCount: inkubatorData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 96, 255, 101),
                                              shape: BoxShape.circle),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(inkubatorData[index]),
                                      ],
                                    ),
                                    Text("kjenucuokbn"),
                                    const Text("Delete"),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
