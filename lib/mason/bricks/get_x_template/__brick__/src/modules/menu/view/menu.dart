import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/modules/menu/view/side_menu.dart';
import '/src/modules/menu/menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const SideMenu(),
      body: GetBuilder<MenuViewModel>(builder: (controller) => controller.selectedPage),
    );
  }
}
