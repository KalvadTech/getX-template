import 'package:flutter/material.dart';
import '/views/custom/custom_button.dart';
import '/config/keys.dart';
import '/views/custom/custom_text.dart';
import '/modules/auth/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(loginPageTitle),
          AuthButton(
            text: 'login',
            onPressed: () => AuthActions.instance.signIn(context),
          ),
        ],
      ),
    );
  }
}
