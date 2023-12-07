import 'package:flutter/material.dart';

class PasswordFieldCustom extends StatefulWidget {
  const PasswordFieldCustom(
      {Key? key,
      required this.title,
      required this.textHint,
      required this.controller})
      : super(key: key);

  final String title;
  final String textHint;
  final TextEditingController controller;

  @override
  PasswordFieldCustomState createState() => PasswordFieldCustomState();
}

class PasswordFieldCustomState extends State<PasswordFieldCustom> {
  bool _isObscure = true;

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
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.textHint,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: Icon(_isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
