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
import 'package:h_l_s_application/features/home/presentation/views/home_view.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/food_plans/mealplans.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/plans_views/training_plans/training_plans_screen.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/profile_views/edit_profile_page.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/profile_views/favorites/favorites_page.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/profile_views/help_and_support_page.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/profile_views/settings_page.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/profile_views/settings_pages/changepassword_page.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/profile_views/settings_pages/notification_setting.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/profile_views/settings_pages/reminder_page.dart';
import 'package:h_l_s_application/features/splash/presentation/views/splash_view.dart';
import 'package:h_l_s_application/features/user_details/presentation/views/user_age_page.dart';
import 'package:h_l_s_application/features/user_details/presentation/views/user_fitness_page.dart';
import 'package:h_l_s_application/features/user_details/presentation/views/user_fitness_goal_page.dart';
import 'package:h_l_s_application/features/user_details/presentation/views/user_height_page.dart';
import 'package:h_l_s_application/features/user_details/presentation/views/user_weight_goal_page.dart';
import 'package:h_l_s_application/features/user_details/presentation/views/user_weight_page.dart';

abstract class AppRouter {
  static const kScreenOne = '/screen1';
  static const kScreenTwo = '/screen2';
  static const kScreenThree = '/screen3';
  static const kLoginPage = '/loginPage';
  static const kSignupPage = '/signupPage';
  static const kResetPasswordPage = '/resetPasswordPage';
  static const kVerityCodePage = '/verityCodePage';
  static const kCreatePasswordPage = '/createPasswordPage';
  static const kPasswordChangedPage = '/passwordChangedPage';
  static const kUserInfoInputs = '/userInfoInputs';
  static const kUserAgePage = '/userAgePage';
  static const kUserWeightPage = 'userWeightPage';
  static const kUserWeightGoalPage = 'userWeightGoalPage';
  static const kUserHeightPage = 'userHeightPage';
  static const kUserFitnessPage = 'userFitnessPage';
  static const kUserFitnessGoalPage = 'userFitnessGoalPage';
  static const kHomeView = '/homeView';
  static const kEditProfilePage = '/editProfilePage';
  static const kSettingsPage = '/settingsPage';
  static const kHelpAndSupportPage = '/helpAndSupportPage';
  static const kFavoritesPage = '/favoritesPage';
  static const kMealPlans = '/mealPlans';
  static const kChangePasswordPage = '/changePasswordPage';
  static const kNotificationSettingPage = '/notificationSettingPage';
  static const kReminderPage = '/reminderPage';
  static const kTrainingPlanPage = '/trainingPlansPage';

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
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kEditProfilePage,
        builder: (context, state) => EditProfilePage(),
      ),
      GoRoute(
        path: AppRouter.kUserInfoInputs,
        builder: (context, state) => UserAgePage(),
        routes: [
          GoRoute(
            path: kUserWeightPage,
            builder: (context, state) => UserWeightPage(),
          ),
          GoRoute(
            path: kUserWeightGoalPage,
            builder: (context, state) => UserWeightGoalPage(),
          ),
          GoRoute(
            path: kUserHeightPage,
            builder: (context, state) => UserHeightPage(),
          ),
          GoRoute(
            path: kUserFitnessPage,
            builder: (context, state) => UserFitnessPage(),
          ),
          GoRoute(
            path: kUserFitnessGoalPage,
            builder: (context, state) => const UserFitnessGoalPage(),
          ),
        ],
      ),
      GoRoute(
        path: kSettingsPage,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: kHelpAndSupportPage,
        builder: (context, state) => const HelpAndSupportPage(),
      ),
      GoRoute(
        path: kFavoritesPage,
        builder: (context, state) => const FavoritePage(),
      ),
      GoRoute(
        path: kMealPlans,
        builder: (context, state) => const MealPlans(),
      ),
      GoRoute(
        path: kChangePasswordPage,
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: kNotificationSettingPage,
        builder: (context, state) => const NotificationSetting(),
      ),
      GoRoute(
        path: kReminderPage,
        builder: (context, state) => const ReminderPage(),
      ),
      GoRoute(
        path: kTrainingPlanPage,
        builder: (context, state) => const TrainingPlansPage(),
      ),
    ],
  );
}
