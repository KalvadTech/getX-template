import 'package:flutter/material.dart';
import 'package:getx_starter/src/modules/auth/views/splash.dart';
import '/src/views/pages/home.dart';
import 'auth_handler.dart';
import 'login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthHandler(onAuthenticated: const HomePage(), onNotAuthenticated: LoginPage(), onChecking: const SplashPage(),);
  }

}
