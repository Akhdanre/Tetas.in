import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/color_string.dart';

class ForgotPassTextWidget extends StatelessWidget {
  const ForgotPassTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Forgot password?",
        style: TextStyle(
          color: blueString,
        ),
      ),
    );
  }
}
