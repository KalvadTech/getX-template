import 'package:flutter/material.dart';
import '/src/config/config.dart';
import '/src/views/custom/custom_button.dart';

class CustomForm extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback onConfirm;
  final String? buttonLabel;
  final _formKey = GlobalKey<FormState>();

  CustomForm(
      {Key? key,
      required this.children,
      required this.onConfirm,
      this.buttonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ...children,
          const SizedBox(height: 24.0),
          AuthButton(
            text: buttonLabel ?? confirmButtonLabel,
            onPressed: confirm,
          )
        ],
      ),
    );
  }

  void confirm(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      onConfirm();
    }
  }
}
