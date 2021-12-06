import 'package:flutter/material.dart';
import '/views/auth/login.dart';
import '/views/pages/home.dart';
import '/modules/auth/widgets/auth_handler.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthHandler(onAuthenticated: HomePage(), onNotAuthenticated: LoginPage());
  }
}
