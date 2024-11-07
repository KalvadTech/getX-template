import 'package:get/get.dart';
import '/src/modules/auth/data/models/user.dart';
import '/src/modules/auth/data/services/auth_service.dart';

/// Enum representing different authentication states.
enum AuthState { checking, authenticated, notAuthenticated }

/// ViewModel responsible for managing authentication logic using GetX.
class AuthViewModel extends GetxController {
  /// Instance of `AuthService` to perform authentication-related operations.
  final AuthService _authService;

  /// Observable authentication state.
  final Rx<AuthState> _authState = AuthState.checking.obs;

  /// Getter for the current authentication state.
  AuthState get authState => _authState.value;

  /// Stores the currently authenticated user.
  UserModel? _user;

  /// Getter for the currently authenticated user.
  UserModel? get user => _user;

  /// Stores the username and password for sign-in.
  String? username, password;

  /// Instance of a new user for the sign-up process.
  UserModel newUser = UserModel.empty();

  /// Constructor initializes with the `AuthService` and checks the session on creation.
  AuthViewModel(this._authService) {
    checkSession();
  }

  // Checks if there is an active session by verifying token status.
  // Refreshes the session if the access token is expired but the refresh token is valid.
  Future<bool> checkSession() async {
    if (await _authService.isLoggedIn()) {
      bool isAccessTokenExpired = await _authService.isAccessTokenExpired();
      bool isRefreshTokenExpired = await _authService.isRefreshTokenExpired();

      if (isAccessTokenExpired && !isRefreshTokenExpired) {
        await refreshSession(); // Refreshes session if only the access token is expired
      } else if (isRefreshTokenExpired) {
        return false; // If both tokens are expired, return false
      }

      authenticated(); // Set state to authenticated if tokens are valid
      update(); // Update GetX UI
      return true;
    }
    notAuthenticated();
    return false;
  }

  /// Refreshes the session by calling the refreshSession method from AuthService
  Future refreshSession() async {
    await _authService.refreshSession();
  }

  /// Performs user sign-in with the provided username and password.
  Future<void> signIn() async {
    await _authService.signIn(username!, password!);
    authenticated();
  }

  /// Registers a new user using the provided `newUser` details.
  Future<void> signUp() async {
    await _authService.signUp(newUser);
  }

  /// Sets the state to authenticated.
  void authenticated() {
    _authState.value = AuthState.authenticated;
  }

  /// Sets the state to not authenticated.
  void notAuthenticated() {
    _authState.value = AuthState.notAuthenticated;
  }

  /// Sets the state to checking.
  void checking() {
    _authState.value = AuthState.checking;
  }

  /// Checks if the current state is authenticated.
  bool isAuthenticated() {
    return _authState.value == AuthState.authenticated;
  }

  /// Checks if the current state is checking.
  bool isChecking() {
    return _authState.value == AuthState.checking;
  }

  /// Logs out the user and sets the state to not authenticated.
  void logout() {
    _authService.signOut();
    notAuthenticated();
  }
}
