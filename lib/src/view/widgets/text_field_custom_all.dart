import 'package:flutter/material.dart';
import 'package:tetas_in/src/view/widgets/text_form_field_custom.dart';

class TextFieldCustomAll extends StatelessWidget {
  const TextFieldCustomAll(
      {super.key, required this.title, required this.textHint});

  final String title;
  final String textHint;
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
          TextFieldCustom(hintTxt: textHint)
        ],
      ),
    );
  }
}
