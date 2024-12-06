import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/page.dart';

/// A [MenuViewModel] class to manage the state and behavior of the menu pages.
/// This class uses [GetX] for reactive state management.
class MenuViewModel extends GetxController {
  /// Observable index to track the currently selected page.
  final RxInt _selectedIndex = 0.obs;

  /// Getter to access the current selected index.
  int get selectedIndex => _selectedIndex.value;

  /// Observable boolean to manage the expanded state.
  final RxBool _expanded = false.obs;

  /// Getter to access the expanded state.
  bool get expanded => _expanded.value;

  /// Stores the currently selected page widget.
  Widget _selectedPage = Container();

  /// Getter to access the currently selected page.
  Widget get selectedPage => _selectedPage;

  /// List of pages available in the menu.
  final List<Widget> _pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  /// Constructor to initialize the default selected page.
  MenuViewModel() {
    _selectedPage = _pages[0];
  }

  /// Method to change the selected page based on the provided [index].
  /// If the index is valid, the corresponding page is set as the selected page.
  /// If the index is out of bounds, the expanded state is toggled.
  void onPageChanges(int index) {
    if (index < _pages.length) {
      _selectedIndex.value = index;
      _selectedPage = _pages[index];
      update(); // Notify listeners about the change.
    } else {
      onExpandedClicked(); // Toggle expanded state if the index is invalid.
    }
  }

  /// Method to toggle the expanded state.
  void onExpandedClicked() {
    _expanded.value = !expanded;
  }
}
