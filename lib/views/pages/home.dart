import 'package:flutter/material.dart';
import '/config/keys.dart';
import '/views/custom/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomText(homePageTitle)),
    );
  }
}
