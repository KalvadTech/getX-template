import 'package:get/get.dart';
import '/src/modules/auth/data/models/user.dart';
import '/src/config/app_exception.dart';
import '/src/essentials/services/memory_service.dart';
import '/src/essentials/config/api_config.dart';
import '/src/essentials/services/api_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


/// The `AuthService` class is responsible for handling all authentication-related
/// operations, such as signing in, signing out, and managing access and refresh tokens.
/// It interacts with the API to authenticate users and saves the tokens in memory for
/// session management. The class also provides methods to check whether the tokens are
/// expired and ensures the user session is maintained. It extends `ApiService` to
/// leverage HTTP request functionalities.
class AuthService extends ApiService {
  // Handles user sign-in by sending credentials (email, password) to the API.
  // Stores the access and refresh tokens in MemoryService upon successful login.
  Future<bool> signIn(String email, String password) async {
    final body = {"email": email, "password": password};
    Response response = await post(
      APIConfiguration.signInUrl,
      headers: getUnauthorizedHeader(), // Uses header without authorization
      body,
    );
    MemoryService.instance.accessToken = response.body['access']; // Save access token
    MemoryService.instance.refreshToken = response.body['refresh']; // Save refresh token
    return true;
  }

  // Handles user sign-up by user information to the API.
  // return true upon successful sign up.
  Future<bool> signUp(UserModel userModel) async {
    final body = userModel.toJson();
    await post(
      APIConfiguration.signUpUrl,
      headers: getUnauthorizedHeader(), // Uses header without authorization
      body,
    );
    return true;
  }

  // Handles user sign-out by clearing tokens and selected venue/zone from MemoryService.
  Future<bool> signOut() async {
    MemoryService.instance.accessToken = null; // Clear access token
    MemoryService.instance.refreshToken = null; // Clear refresh token
    return true;
  }

  // Checks if the user is logged in by verifying if an access token is present in MemoryService.
  Future<bool> isLoggedIn() async {
    String? token = MemoryService.instance.accessToken;
    return token != null; // Returns true if the token is not null
  }

  // Checks if the access token is expired by decoding and analyzing the token.
  // Throws an AppException if the token is null (no session).
  Future<bool> isAccessTokenExpired() async {
    String? token = MemoryService.instance.accessToken;
    if (token == null) {
      throw AuthException('No Session'); // Throw exception if no token found
    }
    return JwtDecoder.isExpired(token); // Use JwtDecoder to check token expiration
  }

  // Checks if the refresh token is expired in a similar way to the access token.
  // Throws an AppException if the refresh token is null (no session).
  Future<bool> isRefreshTokenExpired() async {
    String? token = MemoryService.instance.refreshToken;
    if (token == null) {
      throw AppException('No Session'); // Throw exception if no refresh token found
    }
    return JwtDecoder.isExpired(token); // Use JwtDecoder to check token expiration
  }
}
