import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class DetailHistory extends StatefulWidget {
  const DetailHistory({super.key});

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
            Container()
          ])),
    )));
  }
}
