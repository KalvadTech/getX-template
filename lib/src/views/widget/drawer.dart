import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/src/modules/theme/widgets/theme_switch.dart';
import 'package:getx_starter/src/views/custom/custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: const [
        DrawerItem(title: 'Languages', routeName: '/languages', icon: Icons.language),
        ThemeDrawerItem()
      ],
    ));
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData icon;

  const DrawerItem(
      {Key? key,
      required this.title,
      required this.routeName,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(routeName),
      leading: Icon(icon),
      title: CustomText(title),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
