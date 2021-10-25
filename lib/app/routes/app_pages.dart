import 'package:get/get.dart';

import 'package:onlinebooks/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:onlinebooks/app/modules/authentication/forgetpassword/forget_password._view.dart';
import 'package:onlinebooks/app/modules/authentication/login/login_view.dart';
import 'package:onlinebooks/app/modules/authentication/register/register_view.dart';
import 'package:onlinebooks/app/modules/bookdecription/bindings/bookdecription_binding.dart';
import 'package:onlinebooks/app/modules/bookdecription/views/bookdecription_view.dart';
import 'package:onlinebooks/app/modules/booklist/bindings/booklist_binding.dart';
import 'package:onlinebooks/app/modules/booklist/views/booklist_view.dart';
import 'package:onlinebooks/app/modules/bookread/bindings/bookread_binding.dart';
import 'package:onlinebooks/app/modules/bookread/views/bookread_view.dart';
import 'package:onlinebooks/app/modules/home/bindings/home_binding.dart';
import 'package:onlinebooks/app/modules/home/views/home_view.dart';
import 'package:onlinebooks/app/modules/profile/bindings/profile_binding.dart';
import 'package:onlinebooks/app/modules/profile/views/profile_view.dart';
import 'package:onlinebooks/app/modules/savedbook/bindings/savedbook_binding.dart';
import 'package:onlinebooks/app/modules/savedbook/views/savedbook_view.dart';
import 'package:onlinebooks/app/modules/search/bindings/search_binding.dart';
import 'package:onlinebooks/app/modules/search/views/search_view.dart';
import 'package:onlinebooks/app/modules/splash/bindings/splash_binding.dart';
import 'package:onlinebooks/app/modules/splash/views/splash_view.dart';
import 'package:onlinebooks/app/modules/transaction/bindings/transaction_binding.dart';
import 'package:onlinebooks/app/modules/transaction/views/transaction_view.dart';
import 'package:onlinebooks/app/modules/uploadbooks/bindings/uploadbooks_binding.dart';
import 'package:onlinebooks/app/modules/uploadbooks/views/uploadbooks_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  static const login = Routes.login;
  static const register = Routes.register;
  static const forgetpassword = Routes.forgetpassword;
  static const uploadbooks = Routes.uploadbooks;
  static const bookread = Routes.bookread;
  static const savedbook = Routes.savedbook;
  static const transaction = Routes.transaction;
  static const search = Routes.search;

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
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.uploadbooks,
      page: () => const UploadbooksView(),
      binding: UploadbooksBinding(),
    ),
    GetPage(
      name: _Paths.bookdescription,
      page: () => BookdecriptionView(),
      binding: BookdecriptionBinding(),
    ),
    GetPage(
      name: _Paths.booklist,
      page: () => BooklistView(),
      binding: BooklistBinding(),
    ),
    GetPage(
      name: _Paths.bookread,
      page: () => BookreadView(),
      binding: BookreadBinding(),
    ),
    GetPage(
      name: _Paths.savedbook,
      page: () => const SavedbookView(),
      binding: SavedbookBinding(),
    ),
    GetPage(
      name: _Paths.transaction,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
