import 'package:get/get.dart';
import '/data/models/user.dart';
import 'auth_service.dart';

enum AuthState{authenticated, notAuthenticated}
class AuthViewModel extends GetxController {
  late final AuthService _authService;

  final Rx<AuthState> _authState = AuthState.notAuthenticated.obs;
  AuthState get authState => _authState.value;

  UserModel? _user;
  UserModel? get user => _user;

  String? username, password;
  UserModel newUser = UserModel.empty();

  AuthViewModel(this._authService);

  Future signIn() async{
    _user = await _authService.mockSignIn(username!, password!);
    authenticated();
  }

  Future signUp() async{
    _user = await _authService.mockSignUp(newUser);
  }

  authenticated(){
    _authState.value = AuthState.authenticated;
  }

  notAuthenticated(){
    _authState.value = AuthState.notAuthenticated;
  }

  bool isAuthenticated() {
    return _authState.value == AuthState.authenticated;
  }


}
