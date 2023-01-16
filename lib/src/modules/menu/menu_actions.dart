import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/modules/auth/auth.dart';
import 'menu_view_model.dart';
import 'view/page.dart';

class MenuActions {
  static final MenuActions _mInstance = MenuActions._();

  static MenuActions get instance => _mInstance;

  late MenuViewModel _menuViewModel;

  MenuActions._() {
    _menuViewModel = Get.find();
  }

  Future toHomePage(BuildContext context) async {
    _menuViewModel.onPageChanges(0);
    back();
  }

  Future toJobsPage(BuildContext context) async {
    _menuViewModel.onPageChanges(1);
    back();
  }

  Future viewAllJobs() async {
    _menuViewModel.onPageChanges(1);
  }

  Future toApplierProfilePage(BuildContext context) async {
    Get.toNamed('/company/profile');
  }

  Future toCategoriesPage(BuildContext context) async {
    _menuViewModel.onPageChanges(2);
    back();
  }

  Future logout(BuildContext context) async {
    Get.find<AuthViewModel>().logout();
    Get.back();
  }


  void back() {
    Get.back();
  }

  void toPage1() async{
    Get.to(() => const Page1());
  }

  void toPage2() async{
    Get.to(() => const Page2());
  }

  void toPage3() async{
    Get.to(() => const Page3());
  }

}
