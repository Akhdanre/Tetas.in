import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key, required this.hintTxt});

  final String hintTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 1,
        //     blurRadius: 4,
        //     offset: const Offset(2, 5),
        //   )
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          decoration:
              InputDecoration(border: InputBorder.none, hintText: hintTxt),
        ),
      ),
    );
  }
}
