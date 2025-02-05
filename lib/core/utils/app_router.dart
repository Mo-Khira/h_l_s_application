import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/features/auth/presentation/views/create_password_page.dart';
import 'package:h_l_s_application/features/auth/presentation/views/login_page.dart';
import 'package:h_l_s_application/features/auth/presentation/views/password_changed.dart';
import 'package:h_l_s_application/features/auth/presentation/views/reset_password_page.dart';
import 'package:h_l_s_application/features/auth/presentation/views/signup_page.dart';
import 'package:h_l_s_application/features/auth/presentation/views/verify_code_page.dart';
import 'package:h_l_s_application/features/boarding/views/screen1.dart';
import 'package:h_l_s_application/features/boarding/views/screen2.dart';
import 'package:h_l_s_application/features/boarding/views/screen3.dart';
import 'package:h_l_s_application/features/home/presentation/views/home_view_body.dart';
import 'package:h_l_s_application/features/splash/presentation/views/splash_view.dart';
import 'package:h_l_s_application/features/user_details/presentation/views/user_age_page.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kScreenOne = '/screen1';
  static const kScreenTwo = '/screen2';
  static const kScreenThree = '/screen3';
  static const kLoginPage = '/loginPage';
  static const kSignupPage = '/signupPage';
  static const kResetPasswordPage = '/resetPasswordPage';
  static const kVerityCodePage = '/verityCodePage';
  static const kCreatePasswordPage = '/createPasswordPage';
  static const kPasswordChangedPage = '/passwordChangedPage';
  static const kUserAgePage = '/userAgePage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kScreenOne,
        builder: (context, state) => const ScreenOne(),
      ),
      GoRoute(
        path: kScreenTwo,
        builder: (context, state) => const ScreenTwo(),
      ),
      GoRoute(
        path: kScreenThree,
        builder: (context, state) => const ScreenThree(),
      ),
      GoRoute(
        path: kLoginPage,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: kSignupPage,
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeViewBody(),
      ),
      GoRoute(
        path: kResetPasswordPage,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: kVerityCodePage,
        builder: (context, state) => VerifyCodePage(),
      ),
      GoRoute(
        path: kCreatePasswordPage,
        builder: (context, state) => CreatePasswordPage(),
      ),
      GoRoute(
        path: kPasswordChangedPage,
        builder: (context, state) => PasswordChangedPage(),
      ),
      GoRoute(
        path: kUserAgePage,
        builder: (context, state) => UserAgePage(),
      ),
    ],
  );
}
