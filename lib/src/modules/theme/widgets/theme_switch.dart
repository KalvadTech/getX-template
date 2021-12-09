import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../views/custom/custom_text.dart';
import '../theme.dart';

class ThemeSwitch extends GetWidget<ThemeViewModel> {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CupertinoSwitch(
        value: controller.isDark,
        onChanged: (value) {
          controller.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
        },
      ),
    );
  }
}

class ThemeText extends StatelessWidget {
  const ThemeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomText('Dark mode');
  }
}

class ThemeDrawerItem extends StatelessWidget {
  const ThemeDrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.brightness_3),
      title: ThemeText(),
      trailing: ThemeSwitch(),
    );
  }
}
