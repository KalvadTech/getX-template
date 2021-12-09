import 'package:flutter/material.dart';
import '/src/views/auth/login.dart';
import '/src/views/pages/home.dart';
import '/src/modules/auth/widgets/auth_handler.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthHandler(onAuthenticated: const HomePage(), onNotAuthenticated: LoginPage());
  }

}
