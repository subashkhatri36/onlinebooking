import 'package:get/get.dart';
import 'package:onlinebooks/app/modules/login/bindings/login_binding.dart';
import 'package:onlinebooks/app/modules/login/views/login_view.dart';
import 'package:onlinebooks/app/modules/splash/bindings/splash_binding.dart';
import 'package:onlinebooks/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  static const login = Routes.login;
  static const home = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    //home
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
