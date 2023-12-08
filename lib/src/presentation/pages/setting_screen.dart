import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                      horizontal: screen.horizontal2),
                  child: Column(
                    children: [
                    
                    ],
                  )))),
    );
  }
}
