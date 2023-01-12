import 'package:get/get.dart';
import '/src/modules/auth/auth.dart';


const String initialRoute = '/';
const String authRoute = '/auth';
const String registerRoute = '/register';

List<GetPage> pages = [
GetPage(name: initialRoute, page: () => const AuthPage()),
GetPage(name: registerRoute, page: () => const RegisterPage()),
GetPage(name: registerRoute, page: () => const RegisterPage()),
// GetPage(name: customRoute, page: () => const CustomPage(), middlewares: [AuthMiddleware()]),
];