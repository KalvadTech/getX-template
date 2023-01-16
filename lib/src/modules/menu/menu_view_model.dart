import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/page.dart';

class MenuViewModel extends GetxController {

  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  final RxBool _expanded = false.obs;
  bool get expanded => _expanded.value;

  Widget _selectedPage = Container();
  Widget get selectedPage => _selectedPage;

  final List<Widget> _pages = [const Page1(), const Page2(), const Page3(),];

  MenuViewModel(){
    _selectedPage = _pages[0];
  }

  void onPageChanges(index){
    if(index < _pages.length) {
      _selectedIndex.value = index;
      _selectedPage = _pages[index];
      update();
    }
    else{
      onExpandedClicked();
    }
  }

  void onExpandedClicked(){
    _expanded.value = !expanded;
  }

}
