import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final int? maxLines;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;

  const CustomText(this.text, {Key? key, this.color, this.fontSize, this.fontWeight, this.height, this.letterSpacing, this.fontFamily, this.textAlign, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.tr,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}


class CustomTranslatedText extends StatelessWidget {
  final String textEn;
  final String textAr;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final int? maxLines;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;

  const CustomTranslatedText({ required this.textEn, required this.textAr, Key? key, this.color, this.fontSize, this.fontWeight, this.height, this.letterSpacing, this.fontFamily, this.textAlign, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Get.locale!.languageCode == 'en' ? textEn : textAr,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
