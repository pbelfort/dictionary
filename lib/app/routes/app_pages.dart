import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static final routes = [
    //SPLASH PAGE
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    // HOME PAGE
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),

    //LOGIN PAGE
    // GetPage(
    //   name: Routes.LOGIN,
    //   page: () => const LoginPage(),
    //   binding: LoginBinding(),
    // ),
  ];
}
