import 'package:flutter/material.dart';
import '/config/config.dart';
import 'custom_text.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;

  const AuthButton({Key? key, required this.text, this.onPressed, this.width = double.infinity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: CustomText(text),
        style: authButtonStyle,
      ),
    );
  }
}
