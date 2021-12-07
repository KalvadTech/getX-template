import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '/src/config/config.dart';


class InputsValidator{

  /// regular expression to validate phone numbers work with format 05xxxxxxxx,05x-xxx-xxxx,05x xxx xxxx,5xxxxxxxx,5x-xxx-xxxx,5x xxx xxxx,
  static final RegExp _phoneRegExp = RegExp(r"^0?[5]{1}\d{1}[\- ]?\d{3}[\- ]?\d{4}$");
  static final RegExp _emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp _passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');


  static String? phoneValidator(String? value){
    if(value == null || value.isEmpty) {
      return phoneEmptyMessageKey.tr;
    } else if(!_phoneRegExp.hasMatch(value)) {
      return phoneNotValidMessageKey.tr;
    } else {
      return null;
    }
  }

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