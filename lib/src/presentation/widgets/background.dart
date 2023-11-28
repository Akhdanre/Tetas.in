import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.screen, required this.child});

  final Widget child;

  final SizeConfig screen;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, secondaryColor],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.3, 0.8),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: child);
  }
}
