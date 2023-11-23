import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';

class StatusInfoInku extends StatelessWidget {
  const StatusInfoInku({
    super.key,
    required this.value,
    required this.title,
  });

  final int value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        color: yellowString,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(2, 5),
          )
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title != "Temperature" ? "$value%" : "$value°",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12))
            ],
          )),
    );
  }
}
