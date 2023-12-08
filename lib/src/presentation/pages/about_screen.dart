import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/app_bar_custom.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:tetas_in/src/utils/size_config.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
          child: Background(
              screen: screen,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screen.vertical2, horizontal: screen.horizontal2),
                child: Column(
                  children: [
                    const AppBarCustom(title: "About"),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: screen.height / 1.5,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                textAlign: TextAlign.justify,
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis non mauris id sodales. Maecenas id tincidunt ligula. Fusce leo dui, accumsan at leo sit amet, lobortis interdum felis.v")
                          ]),
                    )
                  ],
                ),
              ))),
    );
  }
}
