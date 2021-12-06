import 'package:flutter/material.dart';
import '/views/custom/custom_button.dart';
import '/modules/auth/auth.dart';
import '/config/const.dart';
import '/config/keys.dart';
import '/views/custom/custom_text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(loginPageTitle),
          CustomButton(
            text: 'login',
            onPressed: () => AuthActions.instance.register(context),
          ),
        ],
      ),
    );
  }
}
