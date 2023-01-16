import 'package:get/get.dart';
import '/src/data/models/user.dart';
import 'auth_service.dart';

enum AuthState{checking, authenticated, notAuthenticated}

class AuthViewModel extends GetxController {
  late final AuthService _authService;

  final Rx<AuthState> _authState = AuthState.checking.obs;
  AuthState get authState => _authState.value;

  UserModel? _user;
  UserModel? get user => _user;

  String? username, password;
  UserModel newUser = UserModel.empty();

  AuthViewModel(this._authService){
    checkSession();
  }

  Future<bool> checkSession() async {
    checking();
    await Future.delayed(const Duration(milliseconds: 1000));
    _user = await _authService.refreshSession();
    if (_user != null) {
      authenticated();
      return true;
    }
    notAuthenticated();
    return false;
  }

  Future signIn() async{
    _user = await _authService.mockSignIn(username!, password!);
    authenticated();
  }

  Future signUp() async{
    _user = await _authService.mockSignUp(newUser);
  }

  void authenticated(){
    _authState.value = AuthState.authenticated;
  }

  void notAuthenticated(){
    _authState.value = AuthState.notAuthenticated;
  }

  void checking(){
    _authState.value = AuthState.checking;
  }

  bool isAuthenticated() {
    return _authState.value == AuthState.authenticated;
  }

  bool isChecking() {
    return _authState.value == AuthState.checking;
  }

  void logout() {
    _authService.logout();
    notAuthenticated();
  }

}
