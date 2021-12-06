import 'package:flutter/material.dart';
import '/config/keys.dart';
import '/views/custom/custom_text.dart';
import '/config/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(child: CustomText(homePageTitle)),
    );
  }
}
