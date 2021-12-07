import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/validator.dart';
import '/views/custom/custom-form-field.dart';
import '/views/custom/custom_button.dart';
import '/config/keys.dart';
import '/views/custom/custom_text.dart';
import '/modules/auth/auth.dart';

class LoginPage extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(loginPageTitle),
              CustomFormField(
                hint: usernameHintKey,
                label: usernameLabelKey,
                onSaved: (value) => controller.username = value,
                validator: InputsValidator.usernameValidator,
              ),
              CustomFormField(
                hint: passwordHintKey,
                label: passwordLabelKey,
                onSaved: (value) => controller.password = value,
                validator: InputsValidator.passwordValidator,
              ),
              const SizedBox(height: 24.0),
              AuthButton(
                text: 'login',
                onPressed: () => login(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      AuthActions.instance.signIn(context);
    }
  }
}
