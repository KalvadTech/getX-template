import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '/config/config.dart';


class InputsValidator{

  static final RegExp _emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp _passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');


  static String? emailValidator(String? value){
    if(value == null || value.isEmpty) {
      return emailEmptyMessageKey.tr;
    } else if(!_emailRegExp.hasMatch(value)) {
      return emailNotValidMessageKey.tr;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value){
    if(value == null || value.isEmpty) {
      return passwordEmptyMessageKey.tr;
    } else if(!_passwordRegExp.hasMatch(value)) {
      return passwordNotValidMessageKey.tr;
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value){
    if(value == null || value.isEmpty) {
      return nameEmptyMessageKey.tr;
    } else {
      return null;
    }
  }

  static String? usernameValidator(String? value){
    if(value == null || value.isEmpty) {
      return usernameEmptyMessageKey.tr;
    } else {
      return null;
    }
  }


}