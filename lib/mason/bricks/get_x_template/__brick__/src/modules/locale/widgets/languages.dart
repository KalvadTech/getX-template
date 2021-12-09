import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../views/custom/custom_text.dart';
import '../model/language.dart';
import '../locale.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LocalizationViewModel>();
    List<Language> languages = controller.languages;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(24.0),
        itemCount: languages.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () => controller.changeLocale(languages[index].code),
          title: CustomText(languages[index].name),
        ),
      ),
    );
  }
}
