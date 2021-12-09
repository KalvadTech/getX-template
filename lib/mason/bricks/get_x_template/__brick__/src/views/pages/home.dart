import 'package:flutter/material.dart';
import '../widget/drawer.dart';
import '/src/config/keys.dart';
import '/src/views/custom/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: const Center(child: CustomText(homePageTitle),),
    );
  }
}
