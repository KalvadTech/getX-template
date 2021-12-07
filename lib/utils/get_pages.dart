import 'package:get/get.dart';
import 'package:getx_starter/views/auth/register.dart';
import '/views/auth/auth.dart';
import '../modules/auth/auth.dart';
import '/modules/connections/connection.dart';

List<GetPage> pages = [
  GetPage(name: '/', page: () => const ConnectivityCheckerSplash()),
  GetPage(name: '/auth', page: () => const Auth(), binding: AuthBindings()),
  GetPage(name: '/register', page: () => RegisterPage()),
];