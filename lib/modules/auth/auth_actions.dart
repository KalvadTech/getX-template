import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/src/overlay_controller_widget_extension.dart';
import '/config/app_exception.dart';
import 'auth_view_model.dart';

class AuthActions {
  static final AuthActions _mInstance = AuthActions._();

  static AuthActions get instance => _mInstance;

  late AuthViewModel _authViewModel;


  AuthActions._() {
    _authViewModel = Get.find();
  }

  Future signIn(BuildContext context) async {
    context.loaderOverlay.show();
    try {
      await _authViewModel.signIn();
      Get.back();
    } on AppException catch (e) {
      Get.snackbar('Authentication Failed', e.toString().tr);
    } finally {
      context.loaderOverlay.hide();
    }
  }

  Future signUp(BuildContext context) async {
    context.loaderOverlay.show();
    try {
      await _authViewModel.signUp();
      Get.snackbar('Sign Up', 'Done Successfully Now Login');
      Get.back();
    } on AppException catch (e) {
      Get.snackbar('Authentication Failed', e.toString().tr);
    } finally {
      context.loaderOverlay.hide();
    }
  }

  void toRegisterPage() {
    Get.toNamed('/register');
  }


}
