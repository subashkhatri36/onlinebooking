import 'package:get/get.dart';

import 'package:onlinebooks/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:onlinebooks/app/modules/authentication/forgetpassword/forget_password._view.dart';
import 'package:onlinebooks/app/modules/authentication/login/login_view.dart';
import 'package:onlinebooks/app/modules/authentication/register/register_view.dart';
import 'package:onlinebooks/app/modules/home/bindings/home_binding.dart';
import 'package:onlinebooks/app/modules/home/views/home_view.dart';
import 'package:onlinebooks/app/modules/profile/bindings/profile_binding.dart';
import 'package:onlinebooks/app/modules/profile/views/profile_view.dart';
import 'package:onlinebooks/app/modules/splash/bindings/splash_binding.dart';
import 'package:onlinebooks/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  static const login = Routes.login;
  static const register = Routes.register;
  static const forgetpassword = Routes.forgetpassword;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: AuthenticationBinding(),
    ),
    //home
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.forgetpassword,
      page: () => const ForgetPasswordView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
