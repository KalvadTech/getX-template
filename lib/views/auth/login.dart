import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/config/config.dart';
import '/views/custom/custom_form.dart';
import '/utils/validator.dart';
import '/views/custom/custom-form-field.dart';
import '/views/custom/custom_text.dart';
import '/modules/auth/auth.dart';

class LoginPage extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  logoPath,
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.contain,
                ),
                const CustomText(loginPageTitle),
                CustomForm(
                  onConfirm: () => login(context),
                  buttonLabel: loginButtonLabel,
                  children: [
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CustomText('You don\'t have account?'),
                    TextButton(
                      child: const CustomText('Register Now'),
                      onPressed: AuthActions.instance.toRegisterPage,
                    )
                  ],
                )
              ],
            ),
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
