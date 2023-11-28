import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {super.key, required this.hintTxt, required this.controller});

  final String hintTxt;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: controller,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: hintTxt),
        ),
      ),
    );
  }
}
