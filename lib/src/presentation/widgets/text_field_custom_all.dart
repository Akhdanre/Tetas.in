import 'package:flutter/material.dart';
import 'package:tetas_in/src/presentation/widgets/text_form_field_custom.dart';

class TextFieldCustomAll extends StatelessWidget {
  const TextFieldCustomAll(
      {super.key,
      required this.title,
      required this.textHint,
      required this.controller});

  final String title;
  final String textHint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldCustom(controller: controller, hintTxt: textHint)
        ],
      ),
    );
  }
}
