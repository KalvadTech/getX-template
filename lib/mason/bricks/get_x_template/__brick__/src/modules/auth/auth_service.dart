import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/src/data/config/api_config.dart';
import '/src/data/models/user.dart';
import '/src/utils/get_utils.dart';

class AuthService extends GetConnect {
  late GetStorage _getStorage;

  AuthService() {
    _getStorage = GetStorage();
    _getStorage.read('user');
  }

  void saveUserToMemory(UserModel userModel) {
    _getStorage.write('user', json.encode(userModel));
  }

  Future removeUserFromMemory() async {
    await _getStorage.remove('user');
  }

  UserModel? fetchUserFromMemory() {
    String? value = _getStorage.read('user');
    value ??= _getStorage.read('user');
    if (value != null) {
      return userModelFromString(value);
    }
    return null;
  }

  Future saveSessionToMemory(String session) async {
    await _getStorage.write('session', session);
  }

  Future removeSessionFromMemory() async {
    await _getStorage.remove('session');
  }

  String? fetchSessionFromMemory() {
    String? value = _getStorage.read('session');
    value ??= _getStorage.read('session');
    return value;
  }

  Future refreshSession() async {
    try {
      String? session = fetchSessionFromMemory();
      if (session != null) {
        Response response = await post(
          refreshSessionUrl,
          session,
        );
        Utils.handleError(response);
        saveSessionToMemory(response.bodyString!);
        return userModelFromJson(response.body);
      }
      return null;
    }
    catch(e){
      return null;
    }
  }


  Future<UserModel> signUp(UserModel user) async {
    Response response = await post(
      signUpUrl,
      user.toJson(),
    );
    Utils.handleError(response);
    return UserModel.fromJson(response.body);
  }

  Future<UserModel> signIn(String username, String password) async {
    Response response = await post(
      signInUrl,
      {"username": username, "password": password},
    );
    Utils.handleError(response);
    return UserModel.fromJson(response.body);
  }

  Future<UserModel> mockSignIn(String username, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    return UserModel.fromJson({});
  }

  Future<UserModel> mockSignUp(UserModel user) async {
    await Future.delayed(const Duration(seconds: 3));
    return UserModel.fromJson(user.toJson());
  }
}
