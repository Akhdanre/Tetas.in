import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class DetailHistory extends StatefulWidget {
  const DetailHistory(
      {super.key,
      required this.id,
      required this.date,
      required this.dataTarget,
      required this.numEgs});

  final String id;
  final String date;
  final String dataTarget;
  final int numEgs;

  @override
  State<DetailHistory> createState() => _DetailHistoryState();
}

class _DetailHistoryState extends State<DetailHistory> {
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
          child: Column(children: [
            const AppBarCustom(title: "Detail History"),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: baseColorBg,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(2, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ID Inkubator"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("ID History"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Periode"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Number Of Egg"),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Column(
                    children: [
                      Text(":"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(":"),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.id.toString()),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(widget.id.toString()),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(widget.dataTarget),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(widget.numEgs.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ])),
    )));
  }
}
