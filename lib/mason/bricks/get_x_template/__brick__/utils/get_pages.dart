import 'package:get/get.dart';
import '/src/views/auth/register.dart';
import '/src/views/auth/auth.dart';
import '../modules/auth/auth.dart';
import '/src/modules/connections/connection.dart';

List<GetPage> pages = [
  GetPage(name: '/', page: () => const ConnectivityCheckerSplash()),
  GetPage(name: '/auth', page: () => const Auth(), binding: AuthBindings()),
  GetPage(name: '/register', page: () => RegisterPage()),
];