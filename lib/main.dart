import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/services/auth_repo.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/features/auth/data/signup_fun.dart';
import 'package:h_l_s_application/features/user_details/data/user_info_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await dotenv.load(fileName: '.env');

  // assert(
  //     dotenv.get('API_BASE_URL').isNotEmpty, 'API_BASE_URL not found in .env');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(AuthRepo()),
        ),
        BlocProvider<UserInfoCubit>(
          create: (_) => UserInfoCubit(),
        ),
      ],
      child: const HLS(),
    ),
  );
}

class HLS extends StatelessWidget {
  const HLS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      // home: const SplashView(),
    );
  }
}

/*


SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text("Profile page"),
                )
              ],
            ),
          ),
        ),
      ),
    );


 */
