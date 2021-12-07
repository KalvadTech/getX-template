import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/validator.dart';
import '/views/custom/custom-form-field.dart';
import '/views/custom/custom_button.dart';
import '/modules/auth/auth.dart';
import '/config/keys.dart';
import '/views/custom/custom_text.dart';

class RegisterPage extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();
  RegisterPage({Key? key}) : super(key: key);

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
              const CustomText(registerPageTitle),
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
              const SizedBox(height: 24.0),
              AuthButton(
                text: 'register',
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
      AuthActions.instance.signUp(context);
    }
  }

}
