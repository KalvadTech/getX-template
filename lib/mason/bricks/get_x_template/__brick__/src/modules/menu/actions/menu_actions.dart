import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/modules/auth/auth.dart';
import '../controllers/menu_view_model.dart';
import '../view/page.dart';

/// A singleton class to manage navigation and menu-related actions.
///
/// This class provides methods to navigate between different pages and
/// manage the interaction with the [MenuViewModel] and [AuthViewModel].
class MenuActions {
  /// Singleton instance of [MenuActions].
  static final MenuActions _mInstance = MenuActions._();

  /// Getter to access the singleton instance.
  static MenuActions get instance => _mInstance;

  /// Reference to the [MenuViewModel] to manage menu state.
  late MenuViewModel _menuViewModel;

  /// Private constructor to initialize the [MenuViewModel].
  MenuActions._() {
    _menuViewModel = Get.find(); // Retrieves the MenuViewModel using GetX.
  }

  /// Navigates to the home page and updates the menu state.
  Future<void> toHomePage(BuildContext context) async {
    _menuViewModel.onPageChanges(0); // Set the first page as selected.
    back(); // Navigate back to the previous screen.
  }

  /// Navigates to the jobs page and updates the menu state.
  Future<void> toJobsPage(BuildContext context) async {
    _menuViewModel.onPageChanges(1); // Set the second page as selected.
    back(); // Navigate back to the previous screen.
  }

  /// Displays all jobs by navigating to the jobs page without going back.
  Future<void> viewAllJobs() async {
    _menuViewModel.onPageChanges(1); // Set the second page as selected.
  }

  /// Navigates to the applier profile page.
  Future<void> toApplierProfilePage(BuildContext context) async {
    Get.toNamed('/company/profile'); // Navigate to the profile page.
  }

  /// Navigates to the categories page and updates the menu state.
  Future<void> toCategoriesPage(BuildContext context) async {
    _menuViewModel.onPageChanges(2); // Set the third page as selected.
    back(); // Navigate back to the previous screen.
  }

  /// Logs out the user by calling the logout method from [AuthViewModel].
  Future<void> logout(BuildContext context) async {
    Get.find<AuthViewModel>().logout(); // Log out the user.
    Get.back(); // Navigate back to the previous screen.
  }

  /// Navigates back to the previous page.
  void back() {
    Get.back();
  }

  /// Navigates to [Page1] using [Get.to].
  void toPage1() async {
    Get.to(() => const Page1());
  }

  /// Navigates to [Page2] using [Get.to].
  void toPage2() async {
    Get.to(() => const Page2());
  }

  /// Navigates to [Page3] using [Get.to].
  void toPage3() async {
    Get.to(() => const Page3());
  }
}
