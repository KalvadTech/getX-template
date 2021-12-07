import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/config/config.dart';
import '/views/custom/custom_form.dart';
import '/utils/validator.dart';
import '/views/custom/custom-form-field.dart';
import '/modules/auth/auth.dart';
import '/views/custom/custom_text.dart';

class RegisterPage extends GetWidget<AuthViewModel> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              logoPath,
              height: MediaQuery.of(context).size.height / 4,
              fit: BoxFit.contain,
            ),
            const CustomText(registerPageTitle),
            CustomForm(
              onConfirm: () => login(context),
              buttonLabel: registerButtonLabel,
              children: [
                CustomFormField(
                  hint: usernameHintKey,
                  label: usernameLabelKey,
                  onSaved: (value) => controller.newUser.username = value,
                  validator: InputsValidator.usernameValidator,
                ),
                CustomFormField(
                  hint: phoneHintKey,
                  label: phoneLabelKey,
                  onSaved: (value) => controller.newUser.phone = value,
                  validator: InputsValidator.phoneValidator,
                ),
                CustomFormField(
                  hint: emailHintKey,
                  label: emailLabelKey,
                  onSaved: (value) => controller.newUser.email = value,
                  validator: InputsValidator.emailValidator,
                ),
                CustomFormField(
                  hint: passwordHintKey,
                  label: passwordLabelKey,
                  onSaved: (value) => controller.newUser.password = value,
                  validator: InputsValidator.passwordValidator,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login(BuildContext context) {
    AuthActions.instance.signUp(context);
  }
}
