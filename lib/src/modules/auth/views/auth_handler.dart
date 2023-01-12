import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth.dart';

class AuthHandler extends GetWidget<AuthViewModel> {
  final Widget onAuthenticated;
  final Widget onChecking;
  final Widget onNotAuthenticated;

  const AuthHandler({
    Key? key,
    required this.onChecking,
    required this.onAuthenticated,
    required this.onNotAuthenticated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isChecking()
          ? onChecking
          : controller.isAuthenticated()
              ? onAuthenticated
              : onNotAuthenticated,
    );
  }
}
