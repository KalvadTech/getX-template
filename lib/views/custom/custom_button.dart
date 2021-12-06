import 'package:flutter/material.dart';
import '/config/const.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double? fontSize;
  final Color color;
  final Color textColor;
  final EdgeInsets? padding;
  final double borderRadius;
  const CustomButton({Key? key, required this.text, this.onPressed, this.color = primaryColor, this.padding, this.borderRadius = 8.0, this.width = double.infinity, this.fontSize, this.textColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: CustomText(text),
        style: ElevatedButton.styleFrom(
            primary: color, padding: padding,
        textStyle: TextStyle(color: textColor, fontSize: fontSize),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))
        ),
      ),
    );
  }
}
