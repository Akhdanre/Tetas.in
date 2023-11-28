import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class Regards extends StatelessWidget {
  const Regards({super.key, required this.screen});

  final SizeConfig screen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screen.vertical2,
        ),
        const Text("HI!\nWELCOME",
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900)),
        const Text(
          "Please enter your account",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: screen.vertical3,
        ),
      ],
    );
  }
}
