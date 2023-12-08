import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';

class ButtonMenu extends StatelessWidget {
  const ButtonMenu(
      {super.key,
      required this.icon,
      required this.text,
      required this.target});

  final IconData icon;
  final String text;
  final Widget target;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => target,
          )),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            color: baseWhite, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 20,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
