import 'package:get/get.dart';
import '/src/data/config/api_config.dart';
import '/src/data/models/user.dart';
import '/src/utils/get_utils.dart';

class AuthService extends GetConnect {

  Future<UserModel> signUp(UserModel user) async {
    Response response = await post(
      signUpUrl,
      user.toJson(),
    );
    handleError(response);
    return UserModel.fromJson(response.body);
  }

  Future<UserModel> signIn(String username, String password) async {
    Response response = await post(
      signInUrl,
      {"username": username, "password": password},
    );
    handleError(response);
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
