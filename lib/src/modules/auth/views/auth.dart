import 'package:flutter/material.dart';
import '/src/modules/auth/views/splash.dart';
import '/src/modules/menu/menu.dart';
import 'auth_handler.dart';
import 'login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthHandler(onAuthenticated: const MenuPage(), onNotAuthenticated: LoginPage(), onChecking: const SplashPage(),);
  }

}
