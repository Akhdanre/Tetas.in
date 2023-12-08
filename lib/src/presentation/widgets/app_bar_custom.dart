import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key, required this.title, this.fontSize = 25.0});
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
