import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/src/essentials/config/action_presenter.dart';
import 'package:getx_starter/src/utils/route_manager.dart';
import '../controllers/auth_view_model.dart';

class AuthActions extends ActionPresenter {
  static final AuthActions _mInstance = AuthActions._();

  static AuthActions get instance => _mInstance;

  late AuthViewModel _authViewModel;

  AuthActions._() {
    _authViewModel = Get.find();
  }

  Future signIn(BuildContext context) async {
    actionHandler(context, () async {
      await _authViewModel.signIn();
      Get.back();
    });
  }

  Future signUp(BuildContext context) async {
    actionHandler(context, () async {
      await _authViewModel.signUp();
      Get.back();
      Get.snackbar('Sign Up', 'Done Successfully Now Login');
    });
  }

  void toRegisterPage() {
    RouteManager.toRegisterPage();
  }
}
